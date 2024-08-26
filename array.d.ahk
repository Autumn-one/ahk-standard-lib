class Array<T = Any> extends Object {
    /**
	 * 判断一个数组是否包含某个项目, 返回一个布尔值 0 或 1
     * 
     * - arr := ["hello", "autumn", "one"]
     * 
     * arr.Includes("hello") // 1
     * 
     * arr.Includes("hello2") // 0
	 */
	Includes(item) => Integer
    /**
     * 将一个数组连接成字符串,默认以逗号连接
     * 
     * arr := ["金", "木", "水", "火", "土"]
     * 
     * arr.Join(",") // "金,木,水,火,土"
     */
    Join(separator) => String
    /**
     * 将数组转换成字符串表示
     * 
     * arr := [1,2,3]
     * 
     * arr.ToString() // "123"
     * 
     * String(arr) // "123"
     */
    ToString() => String
    /**
     * 遍历数组并返回一个新数组,可用来修改数组的每一项
     * 
     * arr := [1,2,3]
     * 
     * arr.Map(i => i * 2) // [2, 4, 6]
     */
    Map(MapFunc) => Array<T>
    /**
     * 单纯遍历数组,返回数组自身
     * 
     * arr := [1,2,3]
     * 
     * arr.ForEach(i => msgbox(i)) // [1,2,3]
     */
    /**
     * 过滤数组,返回一个过滤后的新数组
     * 
     * arr := [1,2,3,4,5,6]
     * 
     * arr.Filter(i => Mod(i, 2)) // [1,3,5]
     */
    Filter(FilterFunc) => Array<T>
    /**
     * 删除数组的第一个元素或从第一个开始的多个元素, 如果只删除一个元素则返回该元素, 删除多个则返回被删除元素组成的数组,该函数改变数组自身
     * 
     * arr := [1,2,3]
     * 
     * arr.Shift(arr) // 1
     * 
     * arr // [2,3]
     */
    Shift(count := 1) => T | Array<T>
    /**
     * 向数组头部添加多个元素,并返回原数组,该方法改变自身
     * 
     * arr := [1,2,3]
     * 
     * arr.UnShift(6,7,8) // [6,7,8,1,2,3]
     */
    UnShift(items*) => Array<T>
    /**
     * 将多个数组连接成一个新数组并返回
     * arr := [1,2,3]
     * 
     * arr.Concat([4,5,6], [7,8,9]) // [1,2,3,4,5,6,7,8,9]
     */
    Concat(arr*) => Array
    /**
     * 传入一个函数, 数组每一项带入执行, 返回值全部为真则返回真, 否则为假
     * @param short 是否短路, 默认为 false 不短路
     * 
     * arr := [true, true]
     * 
     * arr.Every(i => i) // 1
     */
    Every(EveryFunc, short := false) => Integer
    /**
     * 传入一个函数, 数组的每一项带入执行, 有一个返回值为真则返回真, 否则为假
     * @param short 是否短路, 默认为 false 不短路
     * 
     * arr := [true, false]
     * 
     * arr.Some(i => i) // 1
     */
    Some(SomeFunc, short := false) => Integer
    /**
     * 删除数组的某项一次或多次, 并返回原数组, 该函数改变自身
     * @param count 默认删除项目1次, 0 表示删除所有的相同项目
     * 
     * arr := ["金", "木", "水", "火", "土", "土"]
     * 
     * arr.Remove("土") // ["金", "木", "水", "火", "土"]
     * 
     * arr.Remove("土", 2) // ["金", "木", "水", "火"]
     * 
     * arr.Remove("土", 0) // ["金", "木", "水", "火"]
     */
    Remove(item, count := 1) => Array
    /**
     * 传入一个待删除元素组成的数组, 从原数组中删除这些项, 返回原数组, 该函数改变数组自身
     * @param delArr 一个包含待删除元素的数组
     * @param count 每个要删除元素可以被删除的次数, 0 表示删除所有
     * 
     * arr := ["金", "木", "水", "火", "土", "土"]
     * 
     * arr.RemoveAll(["水", "土"]) // ["金", "木", "火", "土"]
     * 
     * arr.RemoveAll(["水", "土"], 0) // ["金", "木", "火"]
     */
    RemoveAll(delArr, count := 1) => Array<T>

    /**
     * 传入一个函数, 找到结果为真的第一个数组项并返回
     * @param FindFunc 用来查找的函数
     * @param DefaultValue 没有找到的时候返回的值
     * 
     * arr := ["木瓜", "西瓜", "土豆", "甜瓜"]
     * 
     * arr.Find(i => i.Includes("甜")) // "甜瓜"
     * 
     * arr.Find(i => i.Includes("黄瓜"), "Null") // "Null"
     */
    Find(FindFunc, DefaultValue := "") => Any

    /**
     * 传入一个函数, 返回结果为真的所有项组成的新数组
     * 
     * arr := ["木瓜", "西瓜", "土豆", "甜瓜"]
     * 
     * arr.FindAll(i => i.Includes("瓜")) // ["木瓜", "西瓜", "甜瓜"]
     */
    FindAll(FindFunc) => Array

 
    /**
     * 查看value是否在数组内部
     * @param value 一个数组项
     * 
     * arr := ["哈哈", "嘿嘿"]
     * 
     * arr.Includes("哈哈") // 1
     * @returns {Integer} 一个布尔值
     */
    Includes(value) => Integer

    /**
     * 查看value在数组中的位置
     * @param value 查看value在数组中的索引位置
     * 
     * arr := ["哈哈", "嘿嘿"]
     * 
     * arr.IndexOf("嘿嘿") // 2
     * @returns {Integer} 如果在数组中返回索引, 0 表示不在
     */
    IndexOf(value) => Integer

    /**
     * 传入一个值或函数返回匹配到的项对应索引组成的新数组
     * @param ValueOrFunc 一个要查找的值或者一个用于查找的函数,函数返回true表示匹配成功
     * 
     * arr := ["木瓜", "西瓜", "土豆", "草莓", "葡萄", "甜瓜", "西瓜"]
     * 
     * arr.IndexOfAll("西瓜") // [2, 7]
     * 
     * arr.IndexOfAll(i => i.Includes("瓜")) // [1, 2, 6, 7]
     * @returns {Array<Integer>} 返回包含所有找到索引的数组
     */
    IndexOfAll(ValueOrFunc) => Array<Integer>

    /**
     * 将数组扁平化
     * @param depth 要铺平数组的层数 0表示无限扁平化
     * 
     * arr := [1, 2, [3, [4, 5]]]
     * 
     * arr.Flat() // [1,2,3,4,5]
     * 
     * arr.Flat(1) // [1,2,3,[4,5]]
     * @returns {Array<T>} 
     */
    Flat(depth := 0) => Array<T>

    /**
     * 数组去重
     * 
     * arr := [1,1,1,2,2,2]
     * 
     * arr.Unique() // [1,2]
     * @returns {Array<T>} 
     */
    Unique() => Array<T>

    /**
     * 数组排序,该方法不改变数组本身,返回新数组
     * @param SortFunc 一个用于排序的函数, 默认值 (a,b) => a - b
     * 
     * arr := [8, 2, 1, 9]
     * 
     * arr.Sort() // [1,2,8,9]
     * 
     * arr.Sort((a,b) => b-a) // [9,8,2,1]
     * @returns {Array<T>} 
     */
    Sort(SortFunc) => Array<T>

    /**
     * 取所有数组交集, 返回一个新的数组
     * @param arr* 传入若干个数组 
     * 
     * arr := [1,2,3]
     * 
     * arr.Intersect([2, 3]) // [2, 3]
     * @returns {Array<T>} 
     */
    Intersect(arr*) => Array<T>

    /**
     * 取数组并集, 返回新的数组
     * @param arr* 多个数组 
     * 
     * arr := [1,2,3]
     * 
     * arr.Union([2,3,4,5]) // [1,2,3,4,5]
     * @returns {Array<T>} 
     */
    Union(arr*) => Array<T>

    /**
     * 排除所有数组共有元素, 剩余元素组成新的数组
     * @param arr* 若干的数组
     * 
     * arr := [1, 2, 3]
     * 
     * arr.Xor([2, 3, 6]) // [1, 6]
     * @returns {Array<T>} 
     */
    Xor(arr*) => Array<T>
    /**
     * 翻转数组, 返回一个新数组
     * @returns {Array<T>} 
     */
    Reverse() => Array<T>
}