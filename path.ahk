#Include string.ahk
class path{
    /**
     * 连接路径,这个函数会处理一些一些麻烦情况,路径的最后一定不含\
     * Join the path, this function will handle some troublesome cases, the path must not contain \ at the end
     * @param {Array<String>} params* 
     * 
     * path.Concat("c:\cbs\", "\dds") // "c:\cbs\dds"
     * 
     * path.Concat("c:\cbs\", "\dds\") // "c:\cbs\dds"
     * @returns {String} 
     */
    static Concat(params*){
        output := ""
        prevEndBias := true ; 上一个是否以反斜杠结尾
        for item in params {
            ; 解决相对路径的拼接问题,例如 .\
            if item.StartsWith(".\") {
                item := item[2, -1]
            }
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
     * Obtain path Folder path
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
     * Gets the file name extension in the path
     * @param {String} pathStr 
     * 
     * path.ExtName("c:\abc\ddd\efs.txt") // "txt"
     * @returns {String} 
     */
    static ExtName(pathStr, Dot := false){
        temp := pathStr.RemoveRight("\").Split("\")[-1]
        arr := temp.Split(".")
        if arr.length <= 1 || arr.length == 2 && arr[1] == "" {
            return ""
        }
        return Dot ? "." arr[-1] : arr[-1]
    }
    
    /**
     * 获取路径中的文件或文件夹名称
     * Gets the name of the file or folder in the path
     * @param {String} PathStr 
     * @param {String} HasSuffix 是否包含后缀
     * 
     * path.BaseName("c:\abc\ddd\efs.txt") // "efs.txt"
     * 
     * path.BaseName("c:\abc\ddd\efs.txt", false) // "efs"
     * @returns {String} 
     */
    static BaseName(pathStr, HasSuffix := true){
        s := pathStr.RemoveRight("\").Split("\")[-1]
        return HasSuffix ? s : s.Split(".")[1]
    }
}