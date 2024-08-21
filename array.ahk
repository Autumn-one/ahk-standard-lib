__DefProp := {}.DefineProp

__DefProp([].Base, "ToString", { Call: __ArrayToString})


__ArrayToString(arr){
    output := "["
    if arr.Length != 0 {
        lastItem := arr.Pop()
    }
    for item in arr {
        output := output . " " String(item) ","
    }
    if IsSet(lastItem) {
        output := output . ' '  String(lastItem)
    }
    output := output . " ]"
    return output
}