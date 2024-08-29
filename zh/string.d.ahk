/** @extends {#string} */
class String extends Primitive{
    /**
     * 将字符串切割成数组 StrSplit方法的别名
     * @param {Array, String} Delimiters 一个分隔符或分隔符组成的数组, 不传就是切割成单个字符 
     * @param {String} OmitChars 一个包含两边要移除的字符组成的字符串, Trim的作用 
     * @param MaxParts 返回的数组的最大长度, 就是切割多少次
     * 
     * str := "木瓜"
     * 
     * str.Split() // ["木", "瓜"]
     * 
     * str2 := "金 木 水土  火"
     * 
     * str.Split([A_Space, A_Tab]) // ["金", "木", "水土", "火"]
     * @returns {Array} 
     */
	Split(Delimiters?, OmitChars?, MaxParts?) => Array
    /**
     * 获取字符串的长度
     */
    Length {
        get => Integer
    }
    /**
     * 判断字符串是否已某个子字符串开头
     * @param startStr
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "木瓜"
     * 
     * str.StartsWith("木") // 1
     * @returns {Integer} 布尔值0 或 1
     */
    StartsWith(startStr, caseSense := true) => Integer
    /**
     * 判断字符串是否已某个子字符串结尾
     * @param endStr 
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "大西瓜"
     * 
     * str.EndsWith("西瓜") // 1
     * @returns {Integer} 布尔值0 或 1
     */
    EndsWith(endStr, caseSense := true) => Integer
    /**
     * 判断字符串是否包含子字符串
     * @param subStr 
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "金木水火土"
     * 
     * str.Includes("火") // 1
     * @returns {Integer} 布尔值
     */
    Includes(subStr, caseSense := true) => Integer
    /**
     * 获取子字符串在字符串中的位置
     * @param subStr 
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "木瓜西瓜"
     * 
     * str.IndexOf("西") // 3
     * @returns {Integer} 
     */
    IndexOf(subStr, caseSense := true) => Integer
    /**
     * 获取子字符串在字符串中的位置, 从右向左搜索
     * @param subStr 
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "木瓜西瓜西"
     * 
     * str.LastIndexOf("西") // 5
     * @returns {Integer} 
     */
    LastIndexOf(subStr, caseSense := true) => Integer
    /**
     * 获取子字符串在字符串中的所有位置, 返回包含所有位置的数组
     * @param subStr 
     * @param caseSense 是否区分大小写, 默认区分
     * 
     * str := "木瓜木有木哈哈木tutu"
     * 
     * str.IndexOfAll("木") // [ 1, 3, 5, 8 ]
     * @returns {Array<Integer>} 
     */
    IndexOfAll(subStr, caseSense := true) => Array<Integer>
    /**
     * 删除字符串两边的指定字符, 默认删除空白
     * @param {String} omitChars 指定多个要删除的字符
     * @returns {String} 
     */
    Trim(omitChars?: String) => String
    /**
     * 删除字符串左边的指定字符, 默认删除空白
     * @param {String} omitChars 
     * @returns {String} 
     */
    TrimLeft(omitChars?: String) => String
    /**
     * 删除字符串右边的指定字符, 默认删除空白
     * @param {String} omitChars 
     * @returns {String} 
     */
    TrimRight(omitChars?: String) => String
    /**
     * 获取字符串指定索引位置的字符编码
     * @param {Integer} index 
     * 
     * str := "西瓜"
     * 
     * str.CharCodeAt(2) // 29916
     * @returns {Integer} 
     */
    CharCodeAt(index: Integer) => Integer
    /**
     * 获取字符串指定索引位置的字符编码
     * @param {Integer} index 
     * 
     * str := "西瓜"
     * 
     * str.CodeAt(2) // 29916
     * @returns {Integer} 
     */
    CodeAt(index: Integer) => Integer
    /**
     * 将多个字符串连接起来
     * @param params* 
     * 
     * str := "金"
     * 
     * str.Concat("木", "水") // "金木水"
     * @returns {String} 
     */
    Concat(params*) => String
    /**
     * 使用字符串包裹另一个字符串
     * @param wrapStr 
     * 
     * str := "鸡蛋"
     * 
     * str.Wrap("**") // "**鸡蛋**"
     * @returns {String} 
     */
    Wrap(wrapStr) => String
    /**
     * 字符串的字符串表示形式, 比普通的打印多一个双引号, 一般用于 String 方法的调用
     * 但是似乎String不会调用自定义的ToString,其他类型可以
     * @returns {String} 
     */
    ToString() => String
    /**
     * 将字符串的所有字符编码拼接起来,返回最终的数字,一般可以用来排序
     * @returns {Integer} 
     */
    ToCode() => Integer
    /**
     * 返回对应字符串的字符编码数组
     * @returns {Array<Integer>} 
     */
    ToCodes() => Array<Integer>
    /**
     * 返回字符串的小写形式
     * @returns {String} 
     */
    ToLower() => String
    /**
     * 返回字符串的大写形式
     * @returns {String} 
     */
    ToUpper() => String
    /**
     * 返回字符的标题形式
     * @returns {String} 
     */
    ToTitle() => String
    /**
     * 字符串模板, 是Format方法的别名
     * @param values 
     * 
     * "我的名字叫:{1}".Format("木瓜") // "我的名字叫:木瓜"
     * @returns {String} 
     */
    Format(values*) => String
    /**
     * 字符串模板
     * @param values 
     * 
     * name := "木瓜"
     * "我的名字叫:{name}".Format(&name) // "我的名字叫:木瓜"
     * @returns {String} 
     */ 
    Templ(&values*) => String
    /**
     * 替换字符串中的某些子字符串
     * @param {String} Needle 要搜索的子字符串
     * @param {String} ReplaceText 替换的字符, 不传就替换成空
     * @param {String | Integer} CaseSense 是否区分大小写, 默认区分
     * @param {VarRef} OutputVarCount 指针存储替换的次数
     * @param {Integer} Limit 默认 -1, 表示最大替换次数
     * 
     * ret := "我是木瓜木木".Replace("木", "金", true, &cc, 2)
     * 
     * println("ret:",ret) // ret: 我是金瓜金木
     * 
     * println("cc:",cc) // cc: 2
     * @returns {String} 
     */
    Replace(Needle: String, ReplaceText?: String, CaseSense?: String | Integer := true, &OutputVarCount?: VarRef, Limit?: Integer) => String
    /**
     * 翻转字符串
     * @returns {String} 
     */
    Reverse() => String
    /**
     * 返回指定字符串的长度, 如果长度已够原样返回, 长度不够则从开始填充, 填充过程可能截断strFill
     * @param {Integer} num 指定要返回的字符串长度
     * @param {String} strFill 不够长度时用来填充的字符串
     * 
     * 'x'.padStart(5, 'ab') // 'ababx'
     * 
     * 'x'.padStart(4, 'ab') // 'abax'
     * 
     * '12'.padStart(10, 'YYYY-MM-DD') // "YYYY-MM-12"
     * 
     * '09-12'.padStart(10, 'YYYY-MM-DD') // "YYYY-09-12"
     * @returns {String} 
     */
    PadStart(num: Integer, strFill: String := " ") => String

    /**
     * 返回指定字符串的长度, 如果长度已够原样返回, 长度不够则从结尾填充, 填充过程可能截断strFill
     * @param {Integer} num 指定要返回的字符串长度
     * @param {String} strFill 不够长度时用来填充的字符串
     * 
     * 'xxx'.padEnd(2, 'ab') // 'xxx'
     * 
     * 'x'.padEnd(4) // 'x   '
     * @returns {String} 
     */
    PadEnd(num: Integer, strFill: String := " ") => String

    /**
     * 返回重复字符串
     * @param {Integer} num 重复次数
     * 
     * 'x'.repeat(3) // "xxx"
     * 
     * 'hello'.repeat(2) // "hellohello"
     * @returns {String} 
     */
    Repeat(num: Integer) => String

    /**
     * 移除字符串中的某个子字符串
     * @param {String} value 要移除的字符串
     * 
     * "西瓜太大".Remove("西瓜") // "太大"
     * 
     * @returns {String} 
     */
    Remove(value: String) => String

    /**
     * 移除字符串左边的子字符串,如果左边不匹配就不管
     * @param {String} value 要移除的左边的字符串
     * 
     * "西瓜太大".RemoveLeft("西瓜") // "太大"
     * 
     * "大西瓜太大".RemoveLeft("西瓜") // "大西瓜太大"
     * @returns {String} 
     */
    RemoveLeft(value: String) => String

    /**
     * 移除字符串右边的子字符串,如果右边不匹配就不管
     * @param {String} value 
     * 
     * "西瓜太甜".RemoveRight("太甜") // "西瓜"
     * @returns {String} 
     */
    RemoveRight(value: String) => String

    /**
     * path.Concat的别名,连接路径,这个函数会处理一些一些麻烦情况,路径的最后一定不含\
     * @param params 
     * 
     * "c:\cbs\".ConcatP("\dds") // "c:\cbs\dds"
     * 
     * "c:\cbs\".ConcatP("\dds\") // "c:\cbs\dds"
     * @returns {String} 
     */
    ConcatP(params*) => String

    /**
     * path.DirName的别名,获取路径的文件夹路径
     * 
     * "c:\abc\ddd\efs.txt".DirName() // "c:\abc\ddd"
     * @returns {String} 
     */
    DirName() => String

    /**
     * path.ExtName的别名,获取路径中文件的后缀名
     * @param dot 
     * 
     * "c:\abc\ddd\efs.txt".ExtName() // "txt"
     * 
     * "c:\abc\ddd\efs.txt".ExtName(true) // ".txt"
     * @returns {String} 
     */
    ExtName(dot := false) => String

    /**
     * path.BaseName的别名,获取路径中的文件或文件夹名称
     * @param HasSuffix 是否包含后缀名
     * 
     * "c:\abc\ddd\efs.txt".BaseName() // "efs.txt"
     * 
     * "c:\abc\ddd\efs.txt".BaseName(false) // "efs"
     * @returns {String} 
     */
    BaseName(HasSuffix := true) => String

}