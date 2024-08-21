println(params*){
    lastChar := params.Pop()
    for item in params {
        FileAppend String(item) " ", "*", "utf-8" 
    }
    FileAppend String(lastChar) "`n", "*", "utf-8"
}

print(params*){
    lastChar := params.Pop()
    for item in params {
        FileAppend item " ", "*", "utf-8" 
    }
    FileAppend lastChar, "*", "utf-8"
}