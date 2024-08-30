; 这里主要复写ToString方法即可,其他的不做处理

(Map.Prototype).DefineProp("ToString", { Call: __MapToString})

__MapToString(m){
    return "Map(" ({}).ToString.Bind(m)() ")"
}