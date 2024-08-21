; 让字符串具备基本的数组访问行为和可循环可切片的行为
#Requires AutoHotkey v2.0
#Include utils.ahk

StrTemp(str, vars*)
{
    for var in vars
        str := StrReplace(str, '{' NameOf(&%var%) '}', %var%)
    return str
    ; https://github.com/thqby/ahk2_lib/blob/master/nameof.ahk
    NameOf(&value) => StrGet(NumGet(ObjPtr(&value) + 8 + 6 * A_PtrSize, 'Ptr'), 'UTF-16')
}

__DefProp := {}.DefineProp
__DefProp("".Base, '__Enum', {Call: __StrEnum})
__DefProp("".Base, '__Item', {get: __StrItemGet, set: __StrItemSet})
__DefProp("".Base, 'Split', {Call: __StrSplit})
__DefProp("".Base, 'Length', {get: __StrLength})
__DefProp("".Base, 'StartsWith', {Call: __StrStartsWith})
__DefProp("".Base, 'EndsWith', {Call: __StrEndsWith})
__DefProp("".Base, 'Includes', {Call: __StrIncludes})
__DefProp("".Base, 'IndexOf', {Call: __StrIndexOf})
__DefProp("".Base, 'Trim', {Call: __StrTrim})
__DefProp("".Base, 'TrimLeft', {Call: __StrTrimLeft})
__DefProp("".Base, 'TrimRight', {Call: __StrTrimRight})
__DefProp("".Base, 'CharCodeAt', {Call: __StrCharCodeAt})
__DefProp("".Base, 'Code', {Call: __StrCharCodeAt})
__DefProp("".Base, 'Concat', {Call: __StrConcat})
__DefProp("".Base, 'Wrap', {Call: __StrWrap})


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
    len := StrLen(str)
    for index, item in params {
        if item < 0 {
            params[index] := len + item + 1
        }
    }
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

__StrCharCodeAt(str, i){
    return Ord(str[i])
}

__StrConcat(str, params*){
    o := ""
    for item in params {
        o := o . item
    }
    return o
}

__StrWrap(str, ch){
    return ch str ch
}