#Include string.ahk
class path{
    /**
     * 连接路径,这个函数会处理一些一些麻烦情况,路径的最后一定不含\
     * @param {Array<String>} params* 
     * 
     * path.Concat("c:\cbs\", "\dds") // "c:\cbs\dds"
     * 
     * path.Concat("c:\cbs\", "\dds\") // "c:\cbs\dds"
     * @returns {String} 
     */
    static Concat(params*){
        output := ""
        prevEndBias := true
        for item in params {
            if prevEndBias {
                output := item.StartsWith("\") ? output.Concat(item[2, -1]) : output.Concat(item)
            }else{
                output := item.StartsWith("\") ? output.Concat(item) : output.Concat("\", item)
            }
            if item.EndsWith("\") {
                prevEndBias := true
            }else{
                prevEndBias := false
            }
        }
        if output.EndsWith("\"){
            return output[1, -2]
        }
        return output
    }

    /**
     * 获取路径的文件夹路径
     * @param {String} pathStr 
     * 
     * path.DirName("c:\abc\ddd\efs.txt") // "c:\abc\ddd"
     * @returns {String} 
     */
    static DirName(pathStr){
        arr := pathStr.RemoveRight("\").Split("\")[1, -2]
        if arr.Length == 0{
            return ""
        }
        return arr.Join("\")
    }

    /**
     * 获取路径中文件的后缀名
     * @param {String} pathStr 
     * 
     * path.ExtName("c:\abc\ddd\efs.txt") // "txt"
     * @returns {String} 
     */
    static ExtName(pathStr){
        temp := pathStr.RemoveRight("\").Split("\")[-1]
        arr := temp.Split(".")
        return arr[-1]
    }
    
    /**
     * 获取路径中的文件或文件夹名称
     * @param {String} PathStr 
     * @param {String} suffix 可选的要从结果后面去除的内容
     * 
     * path.BaseName("c:\abc\ddd\efs.txt") // "efs.exe"
     * 
     * path.BaseName("c:\abc\ddd\efs.txt", ".txt") // "efs"
     * @returns {String} 
     */
    static BaseName(pathStr, suffix := ""){
       
        return pathStr.RemoveRight("\").Split("\")[-1].RemoveRight(suffix)
    }
}