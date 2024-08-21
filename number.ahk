__DefProp := {}.DefineProp
__DefProp(Integer.Prototype, 'ToChar', {Call: __NumberToChar})

__NumberToChar(num){
    msgbox 1
    return Chr(num)
}