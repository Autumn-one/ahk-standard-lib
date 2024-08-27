/** @extends {#Object} */
class Object{
    /**
     * 获取对象的key组成的数组
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Keys() // ["a", "b"]
     * @returns {Array} 
     */
    Keys() => Array

    /**
     * 获取对象的Value组成的数组
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Values() // [1, 2]
     * @returns {Array} 
     */
    Values() => Array
    /**
     * 获取对象的key value对组成的数组
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Items() // [ { key: "a", value: 1 }, { key: "b", value: 2 }, { key: "c", value: 3 } ]
     * @returns {Array} 
     */
    Items() => Array
    /**
     * 返回一个对象的字符串表示
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.ToString() // "{ a: 1, b: 2, c: 3 }"
     * @returns {String} 
     */
    ToString() => String
    /**
     * 一个属性,获取对象的长度
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Length // 2
     */
    Length {
        get => Integer
    }
    /**
     * 判断一个对象是否包含某个属性
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Has("d") // 0
     * 
     * obj.Has("c") // 1
     * @returns {Integer} 
     */
    Has(prop) => Integer
    /**
     * 判断一个对象是否包含某个属性
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Contains("d") // 0
     * 
     * obj.Contains("c") // 1
     * @returns {Integer} 
     */
    Contains() => Integer
    /**
     * 将多个对象进行合并
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Merge({c: 8, d: 9}) // { a: 1, b: 2, c: 8, d: 9 }
     * @returns {Object} 
     */
    Merge(objs*) => Object

}