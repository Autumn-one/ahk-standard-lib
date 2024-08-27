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
    static Concat(params*: Array<String>) => String

    /**
     * 获取路径的文件夹路径
     * @param {String} pathStr 
     * 
     * path.DirName("c:\abc\ddd\efs.txt") // "c:\abc\ddd"
     * @returns {String} 
     */
    static DirName(pathStr: String) => String

    /**
     * 获取路径中文件的后缀名
     * @param {String} pathStr 
     * 
     * path.ExtName("c:\abc\ddd\efs.txt") // "txt"
     * @returns {String} 
     */
    static ExtName(pathStr: String) => String

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
    static BaseName(PathStr: String, suffix?: String := "") => String
}