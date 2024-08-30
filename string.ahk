; 让字符串具备基本的数组访问行为和可循环可切片的行为
#Requires AutoHotkey v2.0
#Include utils.ahk
;@include "en\string.d.ahk"
;@include "zh\string.d.ahk"
#Include path.ahk
__StrTemp(str, vars*)
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
__DefProp("".Base, 'SplitRight', {Call: __StrSplitRight})
__DefProp("".Base, 'Length', {get: __StrLength})
__DefProp("".Base, 'StartsWith', {Call: __StrStartsWith})
__DefProp("".Base, 'EndsWith', {Call: __StrEndsWith})
__DefProp("".Base, 'Includes', {Call: __StrIncludes})
__DefProp("".Base, 'IncludeSome', {Call: __StrIncludeSome})
__DefProp("".Base, 'IncludeEvery', {Call: __StrIncludeEvery})
__DefProp("".Base, 'IndexOf', {Call: __StrIndexOf})
__DefProp("".Base, 'IndexOfAll', {Call: __StrIndexOfAll})
__DefProp("".Base, 'LastIndexOf', {Call: __StrLastIndexOf})
__DefProp("".Base, 'Trim', {Call: __StrTrim})
__DefProp("".Base, 'TrimLeft', {Call: __StrTrimLeft})
__DefProp("".Base, 'TrimRight', {Call: __StrTrimRight})
__DefProp("".Base, 'CharCodeAt', {Call: __StrCharCodeAt})
__DefProp("".Base, 'CodeAt', {Call: __StrCharCodeAt})
__DefProp("".Base, 'Concat', {Call: __StrConcat})
__DefProp("".Base, 'Wrap', {Call: __StrWrap})
__DefProp("".Base, 'ToString', {Call: __StrToString})
__DefProp("".Base, 'Replace', {Call: __StrReplace})
__DefProp("".Base, 'Reverse', {Call: __StrReverse})
__DefProp("".Base, 'ToCode', {Call: __StrToCode})
__DefProp("".Base, 'ToCodes', {Call: __StrToCodes})
__DefProp("".Base, 'ToLower', {Call: (str) => StrLower(str)})
__DefProp("".Base, 'ToUpper', {Call: (str) => StrUpper(str)})
__DefProp("".Base, 'ToTitle', {Call: (str) => StrTitle(str)})
__DefProp("".Base, 'padStart', {Call: __StrPadStart})
__DefProp("".Base, 'padEnd', {Call: __StrPadEnd})
__DefProp("".Base, 'repeat', {Call: __StrRepeat})
__DefProp("".Base, 'Format', {Call: (str, params*) => Format(str, params*)})
__DefProp("".Base, 'Templ', {Call: __StrTemp})
__DefProp("".Base, 'Remove', {Call: (str, value) => value == "" ? str : StrReplace(str, value, unset, true)})
__DefProp("".Base, 'RemoveLeft', {Call: __StrRemoveLeft})
__DefProp("".Base, 'RemoveRight', {Call: __StrRemoveRight})

; path相关的方法
__DefProp("".Base, 'ConcatP', {Call: (str, params*) => path.Concat(str,params*)})
__DefProp("".Base, 'DirName', {Call: (str) => path.DirName(str)})
__DefProp("".Base, 'ExtName', {Call: (str, dot := false) => path.ExtName(str, dot)})
__DefProp("".Base, 'BaseName', {Call: (str, HasSuffix := true) => path.BaseName(str, HasSuffix)})

__StrRemoveLeft(str, value){
    if value == "" {
        return str
    }
    if str.StartsWith(value){
        return str[value.length + 1, -1]
    }
    return str
}

__StrRemoveRight(str, value){
    if value == "" {
        return str
    }
    if str.EndsWith(value) {
        return str[1, str.length - value.length]
    }
    return str
}

__StrPadStart(str, num, fillStr := " ") {
    output := ""
    len := str.Length
    fillLen := fillStr.Length
    if len >= num {
        return str
    }
    if (mul := (num - len) // fillLen) >= 1{
        output := fillStr.Repeat(mul) . str 
    }else{
        output := str
    }
    output := fillStr[1, num - output.length] . output
    return output
}


__StrPadEnd(str, num, fillStr := " ") {
    output := ""
    len := str.Length
    fillLen := fillStr.Length
    if len >= num {
        return str
    }
    if (mul := (num - len) // fillLen) >= 1{
        output := str . fillStr.Repeat(mul)
    }else{
        output := str
    }
    output := output . fillStr[1, num - output.length]
    return output
}


__StrRepeat(str, num){
    output := ""
    loop num {
        output := output . str
    }

    return output
}


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
        if params[1] > params[2] {
            start := params[2]
            end := params[1]
        } else {
            start := params[1]
            end := params[2]
        }
        return SubStr(str, start, end - start + 1)
    }else{
        Throw IndexError("多余的索引")
    }
}

__StrItemSet(str, params*){
    ; 对字符串设置不会产生任何的效果
}

__StrToCode(str){
    output := ""
    for item in str {
        output := output.Concat(Ord(item))
    }
    return output * 1
}
__StrToCodes(str){
    newArr := []
    for item in str {
        newArr.Push(Ord(item))
    }
    return newArr
}

__StrSplit(str, separator, count := -1){
    if count != -1{
        count++
    }
    return StrSplit(str, separator, unset, count)
}

__StrSplitRight(str, seqator, count := -1){
    if count == 0 {
        return [str]
    }
    /**@type {Array<String>} */
    arr := str.Split(seqator)
    if count == -1 {
        return arr
    }
    newArr := []
    loop arr.Length {
        if A_Index <= count {
            newArr.UnShift(arr.Pop())
        }
    }
    (arr.length != 0) && newArr.UnShift(arr.Join(seqator))
    return newArr
}

__StrLength(str){
    return StrLen(str)
}

__StrStartsWith(str, startStr, caseSense := true){
    return InStr(str, startStr, caseSense) == 1
}

__StrEndsWith(str, endStr, caseSense := true){
    return InStr(str, endStr, caseSense, -1) == StrLen(str) - StrLen(endStr) + 1
}

__StrIncludes(str, v, caseSense:= true){
    return InStr(str, v, caseSense) != 0
}

__StrIncludeSome(str, params*){
    return params.Some(item => str.Includes(item), true)
}

__StrIncludeEvery(str, params*){
    return params.Every(item => str.Includes(item), true)
}

__StrIndexOf(str, v, caseSense := true){
    return InStr(str, v, caseSense)
}

__StrIndexOfAll(str, v, caseSense := true){
    newArr := []
    innerStr := str
    sublen := v.Length
    count := 0
    while i := innerStr.IndexOf(v) {
        if i != 0{
            newArr.Push(i + count)
            count := count + i + sublen
            i := i + sublen + 1
            if i + sublen > innerStr.Length{
                break
            }
            innerStr := innerStr[i, -1]
        }else{
            break
        }
    }
    return newArr
}

__StrLastIndexOf(str, v, caseSense := true) {
    return InStr(str, v, caseSense, -1)
}

__StrTrim(str, omitChars?){
    return Trim(str, IsSet(omitChars) ? omitChars : unset)
}

__StrTrimLeft(str, omitChars?){
    return LTrim(str, IsSet(omitChars) ? omitChars : unset)
}

__StrTrimRight(str, omitChars?){
    return RTrim(str, IsSet(omitChars) ? omitChars : unset)
}

__StrCharCodeAt(str, i){
    return Ord(str[i])
}

__StrConcat(str, params*){
    o := str
    for item in params {
        o := o . item
    }
    return o
}

__StrWrap(str, ch){
    return ch str ch
}

__StrToString(str){
    return str.Wrap('"')
}

__StrReplace(str, params*){
    return StrReplace(str, params*)
}

__StrReverse(str){
    return str.Split().Reverse().Join("")
}