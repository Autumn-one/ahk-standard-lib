;@include en\number.d.ahk
;@include zh\number.d.ahk
__DefProp := {}.DefineProp
__DefProp(1.Base, 'ToChar', {Call: __NumberToChar}) ; 数字转字符

__NumberToChar(num){
    return Chr(num)
}