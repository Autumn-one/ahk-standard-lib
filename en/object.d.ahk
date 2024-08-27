/** @extends {#Object} */
class Object{
    /**
     * Gets an array of keys for an object
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Keys() // ["a", "b"]
     * @returns {Array} 
     */
    Keys() => Array

    /**
     * Gets an array of the object's values
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Values() // [1, 2]
     * @returns {Array} 
     */
    Values() => Array
    /**
     * Gets an array of key value pairs for an object
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Items() // [ { key: "a", value: 1 }, { key: "b", value: 2 }, { key: "c", value: 3 } ]
     * @returns {Array} 
     */
    Items() => Array
    /**
     * Returns a string representation of an object
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.ToString() // "{ a: 1, b: 2, c: 3 }"
     * @returns {String} 
     */
    ToString() => String
    /**
     * An attribute that gets the length of the object
     * 
     * obj := {a: 1, b: 2}
     * 
     * obj.Length // 2
     */
    Length {
        get => Integer
    }
    /**
     * Determines whether an object contains a property
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
     * Determines whether an object contains a property
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
     * Merge multiple objects
     * 
     * obj := {a: 1, b: 2, c: 3}
     * 
     * obj.Merge({c: 8, d: 9}) // { a: 1, b: 2, c: 8, d: 9 }
     * @returns {Object} 
     */
    Merge(objs*) => Object

}