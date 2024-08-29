/** @extends {#Array} */
class Array<T = Any> {
    /**
	 * Determines whether an array contains an item and returns a Boolean value of 0 or 1
     * 
     * - arr := ["hello", "autumn", "one"]
     * 
     * arr.Includes("hello") // 1
     * 
     * arr.Includes("hello2") // 0
	 */
	Includes(item) => Integer
    /**
     * Concatenate an array as a string, by default concatenated with commas
     * 
     * arr := ["金", "木", "水", "火", "土"]
     * 
     * arr.Join(",") // "金,木,水,火,土"
     */
    Join(separator) => String
    /**
     * Converts an array to a string representation
     * 
     * arr := [1,2,3]
     * 
     * arr.ToString() // "123"
     * 
     * String(arr) // "123"
     */
    ToString() => String
    /**
     * Walk through the array and return a new array that can be used to modify each item in the array
     * 
     * arr := [1,2,3]
     * 
     * arr.Map(i => i * 2) // [2, 4, 6]
     */
    Map(MapFunc) => Array<T>
    /**
     * Simply traverses the array, returning the array itself
     * 
     * arr := [1,2,3]
     * 
     * arr.ForEach(i => msgbox(i)) // [1,2,3]
     */
    /**
     * Filter array, returns a new filtered array
     * 
     * arr := [1,2,3,4,5,6]
     * 
     * arr.Filter(i => Mod(i, 2)) // [1,3,5]
     */
    Filter(FilterFunc) => Array<T>
    /**
     * Delete the first element of an array or multiple elements starting from the first, return the element if you delete only one element, and return the array of deleted elements if you delete multiple elements. This function changes the array itself
     * 
     * arr := [1,2,3]
     * 
     * arr.Shift(arr) // 1
     * 
     * arr // [2,3]
     */
    Shift(count := 1) => T | Array<T>
    /**
     * Add multiple elements to the header of the array and return the original array, the method changes itself
     * 
     * arr := [1,2,3]
     * 
     * arr.UnShift(6,7,8) // [6,7,8,1,2,3]
     */
    UnShift(items*) => Array<T>
    /**
     * Concatenates multiple arrays into a new array and returns
     * 
     * arr := [1,2,3]
     * 
     * arr.Concat([4,5,6], [7,8,9]) // [1,2,3,4,5,6,7,8,9]
     */
    Concat(arr*) => Array
    /**
     * A function is passed in, each item of the array is carried into execution, and true is returned if all the returned values are true, false otherwise
     * @param short The default value is false. No short circuit
     * 
     * arr := [true, true]
     * 
     * arr.Every(i => i) // 1
     */
    Every(EveryFunc, short := false) => Integer
    /**
     * A function is passed, each item of the array is carried into execution, and if one return value is true, it is returned true, otherwise it is false
     * @param short The default value is false. No short circuit
     * 
     * arr := [true, false]
     * 
     * arr.Some(i => i) // 1
     */
    Some(SomeFunc, short := false) => Integer
    /**
     * Delete an item of an array one or more times, and return the original array, the function changes itself
     * @param count By default, an item is deleted once. 0 indicates that all the same items are deleted
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
     * Pass in an array of elements to be deleted, remove the items from the original array, return the original array, the function changes the array itself
     * @param delArr An array containing the elements to be deleted
     * @param count The number of times each element to be deleted can be deleted, with 0 indicating that all are deleted
     * 
     * arr := ["金", "木", "水", "火", "土", "土"]
     * 
     * arr.RemoveAll(["水", "土"]) // ["金", "木", "火", "土"]
     * 
     * arr.RemoveAll(["水", "土"], 0) // ["金", "木", "火"]
     */
    RemoveAll(delArr, count := 1) => Array<T>

    /**
     * Pass a function that finds the first array item whose result is true and returns it
     * @param FindFunc Function to find
     * @param DefaultValue The value returned if not found
     * 
     * arr := ["木瓜", "西瓜", "土豆", "甜瓜"]
     * 
     * arr.Find(i => i.Includes("甜")) // "甜瓜"
     * 
     * arr.Find(i => i.Includes("黄瓜"), "Null") // "Null"
     */
    Find(FindFunc, DefaultValue := "") => Any

    /**
     * Pass in a function that returns a new array of all the items whose result is true
     * 
     * arr := ["木瓜", "西瓜", "土豆", "甜瓜"]
     * 
     * arr.FindAll(i => i.Includes("瓜")) // ["木瓜", "西瓜", "甜瓜"]
     */
    FindAll(FindFunc) => Array

 
    /**
     * Check whether the value is inside the array
     * @param value An array item
     * 
     * arr := ["哈哈", "嘿嘿"]
     * 
     * arr.Includes("哈哈") // 1
     * @returns {Integer} A Boolean value
     */
    Includes(value) => Integer

    /**
     * View the position of value in the array
     * @param value View the index position of value in the array
     * 
     * arr := ["哈哈", "嘿嘿"]
     * 
     * arr.IndexOf("嘿嘿") // 2
     * @returns {Integer} If an index is returned in an array, 0 indicates absence
     */
    IndexOf(value) => Integer

    /**
     * A value passed in or a function returned to a new array of matched items corresponding to the index
     * @param ValueOrFunc A value to look for or a function to look for, which returns true to indicate a successful match
     * 
     * arr := ["木瓜", "西瓜", "土豆", "草莓", "葡萄", "甜瓜", "西瓜"]
     * 
     * arr.IndexOfAll("西瓜") // [2, 7]
     * 
     * arr.IndexOfAll(i => i.Includes("瓜")) // [1, 2, 6, 7]
     * @returns {Array<Integer>} Returns an array containing all found indexes
     */
    IndexOfAll(ValueOrFunc) => Array<Integer>

    /**
     * Flatten the array
     * @param depth The number of layers to smooth the array 0 indicates infinite flatness
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
     * Array deduplication
     * 
     * arr := [1,1,1,2,2,2]
     * 
     * arr.Unique() // [1,2]
     * @returns {Array<T>} 
     */
    Unique() => Array<T>

    /**
     * Array sorting, this method does not change the array itself, returns a new array
     * @param SortFunc a function for sorting, default (a,b) => a - b
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
     * Take the intersection of all arrays and return a new array
     * @param arr* Pass in several arrays
     * 
     * arr := [1,2,3]
     * 
     * arr.Intersect([2, 3]) // [2, 3]
     * @returns {Array<T>} 
     */
    Intersect(arr*) => Array<T>

    /**
     * Take the array union, return a new array
     * @param arr* Multiple array
     * 
     * arr := [1,2,3]
     * 
     * arr.Union([2,3,4,5]) // [1,2,3,4,5]
     * @returns {Array<T>} 
     */
    Union(arr*) => Array<T>

    /**
     * All elements common to the array are excluded, and the remaining elements form a new array
     * @param arr* Array of several
     * 
     * arr := [1, 2, 3]
     * 
     * arr.Xor([2, 3, 6]) // [1, 6]
     * @returns {Array<T>} 
     */
    Xor(arr*) => Array<T>
    /**
     * Flipping the array returns a new array
     * @returns {Array<T>} 
     */
    Reverse() => Array<T>

    /**
     * Sum an array containing only numbers
     * @returns {Integer} 
     */
    Sum() => Integer

    /**
     * An imitation of the Reduce method in javascript
     * @param ReduceFunc 
     * @param initial 
     * 
     * [1,2,3].Reduce((memo, item) => memo + item) // 1 + 2 + 3 = 6
     * 
     * [1,2,3].Reduce((memo, item) => memo + item, 6) // 6 + 1 + 2 + 3 = 12
     * @returns {Any} 
     */
    Reduce(ReduceFunc, initial?) => Any

    /**
     * An imitation of the ReduceRight method in javascript
     * @param ReduceFunc 
     * @param initial 
     * 
     * [1,2,3].ReduceRight((memo, item) => memo + item) // 3 + 2 + 1 = 6
     * 
     * [1,2,3].ReduceRight((memo, item) => memo + item, 6) // 6 + 3 + 2 + 1 = 12
     * @returns {Any} 
     */
    ReduceRight(ReduceFunc, initial?) => Any
}