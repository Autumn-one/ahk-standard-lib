println(params*){
    if !DllCall("GetStdHandle", "uint", -11, "ptr"){
        return
    }
    output := ""
    lastChar := params.Pop()
    for item in params {
        output := output.Concat(
            String(item),
             " "
        )
    }
    output := output.Concat(String(lastChar), "`n")
    FileAppend output, "*", "utf-8"
}

print(params*){
    if !DllCall("GetStdHandle", "uint", -11, "ptr"){
        return
    }
    lastChar := params.Pop()
    for item in params {
        FileAppend String(item) " ", "*", "utf-8" 
    }
    FileAppend String(lastChar), "*", "utf-8"
}

open_console(){
    if !DllCall("GetStdHandle", "uint", -11, "ptr")
        DllCall("AllocConsole")
}