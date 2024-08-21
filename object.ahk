__DefProp := {}.DefineProp
; __StringPrototype := {}.Base

__DefProp({}.Base, "__Enum", { Call: (obj, *) => obj.OwnProps()})
__DefProp({}.Base, "__Item", { get: (obj, k) => obj.%k%, set: (obj, v, k) => obj.%k% := v})
__DefProp({}.Base, "Keys", { Call: __ObjectKeys })
__DefProp({}.Base, "Values", { Call: __ObjectValues })
__DefProp({}.Base, "Items", { Call: __ObjectItems })
__DefProp({}.Base, "ToString", { Call: __ObjectToString })
__DefProp({}.Base, "Length", { get: (obj, *) => obj.Keys().Length })

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
            o,
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