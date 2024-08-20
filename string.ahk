; 让字符串具备基本的数组访问行为和可循环可切片的行为
#Requires AutoHotkey v2.0
#Include utils.ahk
__DefProp := {}.DefineProp
__StringPrototype := "".Base
__DefProp(__StringPrototype, '__Enum', {Call: __StrEnum})
__DefProp(__StringPrototype, '__Item', {get: __StrItemGet, set: __StrItemSet})
__DefProp(__StringPrototype, 'Split', {Call: __StrSplit})
__DefProp(__StringPrototype, 'Length', {get: __StrLength})
__DefProp(__StringPrototype, 'StartsWith', {Call: __StrStartsWith})
__DefProp(__StringPrototype, 'EndsWith', {get: __StrEndsWith})
__DefProp(__StringPrototype, 'Includes', {get: __StrIncludes})
__DefProp(__StringPrototype, 'IndexOf', {get: __StrIndexOf})
__DefProp(__StringPrototype, 'Trim', {get: __StrTrim})
__DefProp(__StringPrototype, 'TrimLeft', {get: __StrTrimLeft})
__DefProp(__StringPrototype, 'TrimRight', {get: __StrTrimRight})
__DefProp(__StringPrototype, 'CharCodeAt', {get: __StrCharCodeAt})
__DefProp(__StringPrototype, 'Code', {get: __StrCharCodeAt})


__StrEnum(str, paramNum) {
    index := 0, len := StrLen(str)
    return Enumerator

    Enumerator(&k, &v?) {
        char := SubStr(str, ++index, 1)
        if paramNum == 1 {
            k := char
        } else {
            k := index
            v := char
        }
        return index <= len
    }
}

__StrItemGet(str, params*) {
    if params.Length == 1 {
        return SubStr(str, params[1], 1)
    }else if params.Length == 2 {
        return SubStr(str, params[1], params[2] - params[1] + 1)
    }else{
        Throw IndexError("多余的索引")
    }
}

__StrItemSet(str, params*){
    ; 对字符串设置不会产生任何的效果
}

__StrSplit(str, params*){
    return StrSplit(str, params*)
}

__StrLength(str){
    return StrLen(str)
}

__StrStartsWith(str, startStr){

}

__StrEndsWith(str, endStr){

}

__StrIncludes(str, v){

}

__StrIndexOf(str, v){

}

__StrTrim(str, v){

}

__StrTrimLeft(str, v){

}

__StrTrimRight(str, v){

}

__StrCharCodeAt(str, v){

}