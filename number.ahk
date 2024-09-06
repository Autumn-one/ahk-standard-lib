;@include en\number.d.ahk
;@include zh\number.d.ahk
__DefProp := {}.DefineProp
__DefProp(1.Base, 'ToChar', {Call: __NumberToChar}) ; 数字转字符
__DefProp(1.Base, 'ToString', {Call: __NumberToString}) ; 数字转字符

; todo 还缺少进制转换相关函数

__NumberToChar(num){
    return Chr(num)
}

__NumberToString(num){
    return String(num)
}