
;@include en\object.d.ahk
;@include zh\object.d.ahk
({}.Base).DefineProp("__Enum", { Call: (obj, *) => obj.OwnProps()})
({}.Base).DefineProp("__Item", { get: (obj, k) => obj.%k%, set: (obj, v, k) => obj.%k% := v})
({}.Base).DefineProp("Keys", { Call: __ObjectKeys })
({}.Base).DefineProp("Values", { Call: __ObjectValues })
({}.Base).DefineProp("Items", { Call: __ObjectItems })
({}.Base).DefineProp("ToString", { Call: __ObjectToString })
({}.Base).DefineProp("Length", { get: (obj, *) => obj.Keys().Length })
({}.Base).DefineProp("Has", { Call: __ObjectHas })
({}.Base).DefineProp("Contains", { Call: __ObjectContains })
({}.Base).DefineProp("Merge", { Call: __ObjectMerge })



__ObjectMerge(obj, params*){
    for oitem in params {
        for k, v in oitem {
            obj[k] := v
        }
    }
    return obj
}

__ObjectHas(obj, prop){
    return obj.HasOwnProp(prop)
}

__ObjectContains(obj, prop){
    return obj.HasOwnProp(prop)
}

__ObjectEnum(obj, paramNum){
    EnumFn := obj.OwnProps()
    return innerEnum
    innerEnum(&arg1, &arg2?){
        if paramNum == 1 {
            flag := EnumFn(&innerArg1)
            if !flag {
                return flag
            }
            arg1 := obj.%innerArg1%
        }else if paramNum == 2 {
            flag := EnumFn(&arg1, &arg2)
            if !flag {
                return flag
            }
        }
    }
}


__ObjectKeys(obj){
    arr := []
    for key in obj {
        arr.Push(key)
    } 
    return arr
}

__ObjectValues(obj){
    arr := []
    for _, value in obj {
        arr.Push(value)
    }
    return arr
}

__ObjectItems(obj){
    arr := []
    for k, v in obj {
        arr.Push({key: k, value: v})
    }
    return arr
}

__ObjectToString(obj){
    o := "{ "
    for k, v in obj {
        o := o.Concat(
            k,
            ": ",
            type(v) == "String" ? v.wrap('"') : v,
            ", "
        )
    }
    if o[-2, -1] == ", " {
        o := o[1, -3]
    }
    o := o " }"
    return o
}