class path{
    /**
     * Join the path, this function will handle some troublesome cases, the path must not contain \ at the end
     * @param {Array<String>} params* 
     * 
     * path.Concat("c:\cbs\", "\dds") // "c:\cbs\dds"
     * 
     * path.Concat("c:\cbs\", "\dds\") // "c:\cbs\dds"
     * @returns {String} 
     */
    static Concat(params*: Array<String>) => String

    /**
     * Obtain path Folder path
     * @param {String} pathStr 
     * 
     * path.DirName("c:\abc\ddd\efs.txt") // "c:\abc\ddd"
     * @returns {String} 
     */
    static DirName(pathStr: String) => String

    /**
     * Gets the file name extension in the path
     * @param {String} pathStr 
     * 
     * path.ExtName("c:\abc\ddd\efs.txt") // "txt"
     * @returns {String} 
     */
    static ExtName(pathStr: String) => String

    /**
     * Gets the name of the file or folder in the path
     * @param {String} PathStr 
     * @param {String} suffix Optional content to remove from the end of the result
     * 
     * path.BaseName("c:\abc\ddd\efs.txt") // "efs.exe"
     * 
     * path.BaseName("c:\abc\ddd\efs.txt", ".txt") // "efs"
     * @returns {String} 
     */
    static BaseName(PathStr: String, suffix?: String := "") => String
}