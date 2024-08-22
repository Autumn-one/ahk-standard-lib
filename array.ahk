([].Base).DefineProp("ToString", { Call: __ArrayToString})

__OriginArrayItem := ObjGetBase([]).GetOwnPropDesc("__Item")
([]).Base.DefineProp("RawGet", { Call: (arr, index) => __OriginArrayItem.get.bind(arr)(index) })
([]).Base.DefineProp("RawSet", { Call: (arr, value, index) => ( __OriginArrayItem.set.bind(arr)(value, index)) })
([]).Base.DefineProp("__Item", { get: __ArrayItemGet, set: __ArrayItemSet})

([].Base).DefineProp("Join", { Call: __ArrayJoin})
([].Base).DefineProp("Map", { Call: __ArrayMap})
([].Base).DefineProp("Filter", { Call: __ArrayFilter})
([].Base).DefineProp("Shift", { Call: __ArrayShift})
([].Base).DefineProp("UnShift", { Call: __ArrayUnShift})
([].Base).DefineProp("Concat", { Call: __ArrayConcat})
([].Base).DefineProp("Every", { Call: __ArrayEvery})
([].Base).DefineProp("Some", { Call: __ArraySome})
([].Base).DefineProp("Remove", { Call: __ArrayRemove})
([].Base).DefineProp("Find", { Call: __ArrayFind})
([].Base).DefineProp("FindAll", { Call: __ArrayFindAll})
([].Base).DefineProp("Contains", { Call: __ArrayContains})
([].Base).DefineProp("Includes", { Call: __ArrayIncludes})
([].Base).DefineProp("IndexOf", { Call: __ArrayIndexOf})
([].Base).DefineProp("IndexOfAll", { Call: __ArrayIndexOfAll})
([].Base).DefineProp("Flat", { Call: __ArrayFlat})
([].Base).DefineProp("Sort", { Call: __ArraySort})

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
    return ret
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
    for index, item in arr {
        FileAppend 1, "*"
        if item == value {
            arr.RemoveAt(index)
            i++
            if i == 0 {
                continue
            } else if i == count {
                break
            }
        }
    }
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

__ArrayContains(arr, value){
    for item in arr {
        if item == value {
            return true
        }
    }
    return false
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
    
}

__ArrayItemGet(arr, params*){
    if params.Length == 1 {
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


