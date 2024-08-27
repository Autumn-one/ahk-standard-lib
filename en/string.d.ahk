/** @extends {#string} */
class String extends Primitive{
    /**
     * Cuts a string into an alias for the array StrSplit method
     * @param {Array, String} Delimiters A delimiter or array of delimiters that is not passed is cut into a single character
     * @param {String} OmitChars A string containing the characters to be removed on both sides, the role of Trim
     * @param MaxParts The maximum length of the returned array is the number of cuts
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
     * Gets the length of the string
     */
    Length {
        get => Integer
    }
    /**
     * Determines whether the string begins with a substring
     * @param startStr
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "木瓜"
     * 
     * str.StartsWith("木") // 1
     * @returns {Integer} Boolean value 0 or 1
     */
    StartsWith(startStr, caseSense := true) => Integer
    /**
     * Determines whether the string ends with a substring
     * @param endStr 
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "大西瓜"
     * 
     * str.EndsWith("西瓜") // 1
     * @returns {Integer} Boolean value 0 or 1
     */
    EndsWith(endStr, caseSense := true) => Integer
    /**
     * Determines whether the string contains substrings
     * @param subStr 
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "金木水火土"
     * 
     * str.Includes("火") // 1
     * @returns {Integer} Boolean
     */
    Includes(subStr, caseSense := true) => Integer
    /**
     * Gets the position of the substring in the string
     * @param subStr 
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "木瓜西瓜"
     * 
     * str.IndexOf("西") // 3
     * @returns {Integer} 
     */
    IndexOf(subStr, caseSense := true) => Integer
    /**
     * Gets the position of the substring in the string, searching from right to left
     * @param subStr 
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "木瓜西瓜西"
     * 
     * str.LastIndexOf("西") // 5
     * @returns {Integer} 
     */
    LastIndexOf(subStr, caseSense := true) => Integer
    /**
     * Gets all positions of the substring in the string and returns an array containing all positions
     * @param subStr 
     * @param caseSense Case sensitive: Case sensitive by default
     * 
     * str := "木瓜木有木哈哈木tutu"
     * 
     * str.IndexOfAll("木") // [ 1, 3, 5, 8 ]
     * @returns {Array<Integer>} 
     */
    IndexOfAll(subStr, caseSense := true) => Array<Integer>
    /**
     * Deletes the specified characters on both sides of the string. By default, whitespace is deleted
     * @param {String} omitChars Specify multiple characters to delete
     * @returns {String} 
     */
    Trim(omitChars?: String) => String
    /**
     * Removes the specified character to the left of the string. By default, whitespace is removed
     * @param {String} omitChars 
     * @returns {String} 
     */
    TrimLeft(omitChars?: String) => String
    /**
     * Removes the specified character to the right of the string. By default, whitespace is removed
     * @param {String} omitChars 
     * @returns {String} 
     */
    TrimRight(omitChars?: String) => String
    /**
     * Gets the character encoding for the specified index position of the string
     * @param {Integer} index 
     * 
     * str := "西瓜"
     * 
     * str.CharCodeAt(2) // 29916
     * @returns {Integer} 
     */
    CharCodeAt(index: Integer) => Integer
    /**
     * Gets the character encoding for the specified index position of the string
     * @param {Integer} index 
     * 
     * str := "西瓜"
     * 
     * str.CodeAt(2) // 29916
     * @returns {Integer} 
     */
    CodeAt(index: Integer) => Integer
    /**
     * Concatenate multiple strings
     * @param params* 
     * 
     * str := "金"
     * 
     * str.Concat("木", "水") // "金木水"
     * @returns {String} 
     */
    Concat(params*) => String
    /**
     * Wrap a string around another string
     * @param wrapStr 
     * 
     * str := "鸡蛋"
     * 
     * str.Wrap("**") // "**鸡蛋**"
     * @returns {String} 
     */
    Wrap(wrapStr) => String
    /**
     * The String representation of a string, with one more double quotation mark than the ordinary print, is generally used for the call of the string method
     * But it seems that String doesn't call the custom ToString, other types do
     * @returns {String} 
     */
    ToString() => String
    /**
     * Concatenates all the character encodings of a string and returns the final number, which can generally be used for sorting
     * @returns {Integer} 
     */
    ToCode() => Integer
    /**
     * Returns an array of character encodings for the corresponding string
     * @returns {Array<Integer>} 
     */
    ToCodes() => Array<Integer>
    /**
     * Returns the lowercase form of a string
     * @returns {String} 
     */
    ToLower() => String
    /**
     * Returns the uppercase form of a string
     * @returns {String} 
     */
    ToUpper() => String
    /**
     * Returns the title form of the character
     * @returns {String} 
     */
    ToTitle() => String
    /**
     * String template, which is an alias for the Format method
     * @param values 
     * 
     * "我的名字叫:{1}".Format("木瓜") // "我的名字叫:木瓜"
     * @returns {String} 
     */
    Format(values*) => String
    /**
     * String template
     * @param values 
     * 
     * name := "木瓜"
     * "我的名字叫:{name}".Format(&name) // "我的名字叫:木瓜"
     * @returns {String} 
     */ 
    Templ(&values*) => String
    /**
     * Replaces some substrings in a string
     * @param {String} Needle The substring to search for
     * @param {String} ReplaceText The replacement character is replaced with blank if not passed
     * @param {String | Integer} CaseSense Case sensitive: Case sensitive by default
     * @param {VarRef} OutputVarCount The pointer stores the number of substitutions
     * @param {Integer} Limit The default value is -1, indicating the maximum number of replacements
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
     * Flip string
     * @returns {String} 
     */
    Reverse() => String
    /**
     * Returns the length of the specified string, if it is long enough to return as is, if it is not long enough to fill from the beginning, the filling process may truncate strFill
     * @param {Integer} num Specifies the length of the string to return
     * @param {String} strFill A string to fill if it is not long enough
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
     * Returns the length of the specified string, if it is long enough to return as is, if it is not long enough to fill from the end, the filling process may truncate strFill
     * @param {Integer} num Specifies the length of the string to return
     * @param {String} strFill A string to fill if it is not long enough
     * 
     * 'xxx'.padEnd(2, 'ab') // 'xxx'
     * 
     * 'x'.padEnd(4) // 'x   '
     * @returns {String} 
     */
    PadEnd(num: Integer, strFill: String := " ") => String

    /**
     * Return duplicate string
     * @param {Integer} num times of repetition
     * 
     * 'x'.repeat(3) // "xxx"
     * 
     * 'hello'.repeat(2) // "hellohello"
     * @returns {String} 
     */
    Repeat(num: Integer) => String

    /**
     * Removes a substring from a string
     * @param {String} value The string to remove
     * 
     * "西瓜太大".Remove("西瓜") // "太大"
     * 
     * @returns {String} 
     */
    Remove(value: String) => String

    /**
     * Remove the substring to the left of the string. If the left side does not match, leave it alone
     * @param {String} value The left string to remove
     * 
     * "西瓜太大".RemoveLeft("西瓜") // "太大"
     * 
     * "大西瓜太大".RemoveLeft("西瓜") // "大西瓜太大"
     * @returns {String} 
     */
    RemoveLeft(value: String) => String

    /**
     * Remove the substring to the right of the string. If the right side does not match, leave it alone
     * @param {String} value 
     * 
     * "西瓜太甜".RemoveRight("太甜") // "西瓜"
     * @returns {String} 
     */
    RemoveRight(value: String) => String
}