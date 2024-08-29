;@include en\array.d.ahk
;@include zh\array.d.ahk
;todo 还差mapx 和 filterx 没实现
([].Base).DefineProp("ToString", { Call: __ArrayToString})

__OriginArrayItem := ObjGetBase([]).GetOwnPropDesc("__Item")
([]).Base.DefineProp("RawGet", { Call: (arr, index) => __OriginArrayItem.get.bind(arr)(index) })
([]).Base.DefineProp("RawSet", { Call: (arr, value, index) => ( __OriginArrayItem.set.bind(arr)(value, index)) })
([]).Base.DefineProp("__Item", { get: __ArrayItemGet, set: __ArrayItemSet})

([].Base).DefineProp("Join", { Call: __ArrayJoin})
([].Base).DefineProp("Map", { Call: __ArrayMap})
([].Base).DefineProp("ForEach", { Call: __ArrayForEach})
([].Base).DefineProp("Filter", { Call: __ArrayFilter})
([].Base).DefineProp("Shift", { Call: __ArrayShift})
([].Base).DefineProp("UnShift", { Call: __ArrayUnShift})
([].Base).DefineProp("Concat", { Call: __ArrayConcat})
([].Base).DefineProp("Every", { Call: __ArrayEvery})
([].Base).DefineProp("Some", { Call: __ArraySome})
([].Base).DefineProp("Remove", { Call: __ArrayRemove})
([].Base).DefineProp("RemoveAll", { Call: __ArrayRemoveAll})
([].Base).DefineProp("Find", { Call: __ArrayFind})
([].Base).DefineProp("FindAll", { Call: __ArrayFindAll})
([].Base).DefineProp("Includes", { Call: __ArrayIncludes})
([].Base).DefineProp("IndexOf", { Call: __ArrayIndexOf})
([].Base).DefineProp("IndexOfAll", { Call: __ArrayIndexOfAll})
([].Base).DefineProp("Flat", { Call: __ArrayFlat})
([].Base).DefineProp("Unique", { Call: __ArrayUnique})
([].Base).DefineProp("Sort", { Call: __ArraySort})
([].Base).DefineProp("Reverse", { Call: __ArrayReverse})
([].Base).DefineProp("Intersect", { Call: __ArrayIntersect})
([].Base).DefineProp("Union", { Call: __ArrayUnion})
([].Base).DefineProp("Xor", { Call: __ArrayXor})
([].Base).DefineProp("Sum", { Call: __ArraySum})
([].Base).DefineProp("Reduce", { Call: __ArrayReduce})
([].Base).DefineProp("ReduceRight", { Call: __ArrayReduceRight})

__ArraySum(arr) {
    return arr.Reduce((m, i) => i + m)
}

__ArrayReduce(arr, ReduceFunc, initial?){
    if !IsSet(initial) {
        reduceArr := arr[2, -1]
        memo := arr[1]
    }else{
        reduceArr := arr[]
        memo := initial
    }

    for item in reduceArr {
        memo := ReduceFunc(memo, item)
    }
    return memo
}

__ArrayReduceRight(arr, ReduceFunc, initial?){
    if !IsSet(initial) {
        reduceArr := arr[1, -2]
        memo := arr[-1]
    }else{
        reduceArr := arr[]
        memo := initial
    }

    loop reduceArr.Length {
        memo := ReduceFunc(memo, reduceArr[-A_Index])
    }
    return memo
}


__ArrayJoin(arr, separator := ","){
    output := ""
    for item in arr {
        output := output String(item) . separator
    }
    if separator.Length >= 1 && output[-1, 0 - separator.length] == separator{
        output := output[1, -1 - separator.length]
    }
    return output
}

__ArrayUnion(arr, params*) {
    newArr := [arr*]
    params.forEach(item => item.forEach(i => !newArr.Includes(i) && newArr.Push(i)))
    return newArr
}

__ArrayXor(arr, params*) {
    newArr := []
    iArr := arr.Intersect(params*)
    arr.Union(params*).forEach(i => !iArr.Includes(i) && newArr.Push(i))
    return newArr
}

__ArrayIntersect(arr, params*){
    newArr := []
    for item in arr {
        value := item
        if params.Every((i) => i.Includes(value), true) {
            newArr.Push(value)
        }
    }
    return newArr
}


__ArrayForEach(arr, eachfn){
    for item in arr {
        eachfn(item)
    }
}

__ArrayMap(arr, mapfn){
    newArr := []
    for item in arr {
        newArr.Push(mapfn(item))
    }
    return newArr
}


__ArrayFilter(arr, filterfn){
    newArr := []
    for item in Arr {
        if filterfn(item) {
            newArr.Push(item)
        }
    }
    return newArr
}


__ArrayShift(arr, count := 1){ ; 默认删除头部一个元素
    ret := arr[1, count]
    arr[1, count] := [] 
    return ret.Length == 1 ? ret[1] : ret
}

__ArrayUnShift(arr, params*){ ; 向头部添加若干个元素
    arr.InsertAt(1, params*)
    return arr
}

__ArrayConcat(arr, params*){
    for item in params {
        arr.Push(item*)
    }
    return arr
}

__ArrayEvery(arr, everyfn, short := false){ ; 默认不短路
    flag := true
    for item in arr {
        if !everyfn(item){
            flag := false
            if short {
                break
            }
        }
    }
    return flag
}

__ArraySome(arr, somefn, short := false){ ; 默认不短路
    flag := false
    for item in arr {
        if somefn(item) {
            flag := true
            if short {
                break
            }
        }
    }
    return flag
}

__ArrayRemove(arr, value, count := 1){ ; 默认删除一个
    i := 0
    loop arr.length {
        if A_Index > arr.length {
            break
        }
        if arr[A_Index] == value {
            arr.RemoveAt(A_Index)
            i++
            A_Index--
            if count == 0 {
                continue
            } else if i == count {
                break
            }
        }
    }
    return arr
}

__ArrayRemoveAll(arr, delArr, count := 1){
    delArr.forEach(i => arr.remove(i, count))
    return arr
}

__ArrayFind(arr, findfn, dv := ""){
    for item in arr {
        if findfn(item) {
            return item
        }
    }
    return dv
}

__ArrayFindAll(arr, findallfn){
    newArr := []
    for item in arr {
        if findallfn(item) {
            newArr.Push(item)
        }
    }
    return newArr
}

__ArrayIncludes(arr, value){
    for item in arr {
        if item == value {
            return true
        }
    }
    return false
}

__ArrayIndexOf(arr, value){
    for index, item in arr {
        if item == value {
            return index
        }
    }
    return 0
}

__ArrayIndexOfAll(arr, fn){
    newArr := []
    if type(fn) != "Func"{
        checkfn := (item) => item == fn
    }else{
        checkfn := fn
    }
    for index, item in arr {
        if checkfn(item) {
            newArr.Push(index)
        }
    }
    return newArr
}

__ArrayFlat(arr, depth := 0, count := 0){
    newArr := []
    for item in arr {
        if type(item) == "Array" && ( depth == 0 || depth != count){
            newArr.Push(__ArrayFlat(item, depth, count + 1)*)
        }else{
            newArr.Push(item)
        }
    }
    return newArr
}

__ArraySort(arr, sortfn := (a,b) => a - b){
    if arr.length < 1 {
        return []
    }
    left := []
    right := []
    middle := []
    base := arr[1]
    for item in arr {
        cond := sortfn(item, base)
        if cond < 0 {
            left.push(item)
        }else if cond > 0{
            right.push(item)
        }else{
            middle.push(item)
        }
    }

    return [].Concat(__ArraySort(left, sortfn), middle, __ArraySort(right, sortfn))

}

__ArrayReverse(arr){
    newArr := []
    loop arr.Length {
        newArr.Push(arr[-A_Index])
    }
    return newArr
}

__ArrayUnique(arr){
    newArr := []
    for item in arr {
        if !newArr.Includes(item){
            newArr.Push(item)
        }
    }
    return newArr
}

__ArrayItemGet(arr, params*){
    if params.Length == 0{
        return arr.Clone()
    }else if params.Length == 1 {
        return arr.RawGet(params.RawGet(1))
    }else if params.Length == 2{
        outArr := []
        for index, item in params {
            if item < 0 {
                params.RawSet(item + arr.Length + 1, index)
            }
        }
    
        index := params.RawGet(1)
        end := params.RawGet(2)
        loop{
            outArr.Push(arr.RawGet(index))
            index++
        } until index > end
        return outArr

    }
}

__ArrayItemSet(arr, value, params*){
    if params.length == 1{
        arr.RawSet(value, params.RawGet(1))
    }else if params.length == 2 {
        for index, item in params {
            if item < 0 {
                params.RawSet(item + arr.length + 1, index)
            }
        }
        arr.RemoveAt(params.RawGet(1), params.RawGet(2) - params.RawGet(1) + 1)
        if type(value) == "Array"{
            if value.Length != 0 {
                arr.InsertAt(params.RawGet(1), value*)
            }
        }else{
            arr.insertAt(params.RawGet(1), value)
        }
    }
}

__ArrayToString(arr){
    output := "["
    for item in arr {
        output := output.Concat(
            " ",
            type(item) == "String" ? item.ToString() : String(item),
            ","
        )
    }
    if output[-1] == "," {
        output := output[1, -2]
    }
    output := output . " ]"
    return output
}


