# ahk-standard-lib

autohotkey语言的标准库,目标是提供更好的数据结构操作体验.项目开源,欢迎参与.

## 字符串相关方法

- Split 切割字符串返回一个数组
- Length 返回字符串的长度，这是一个属性
- StartsWith 判断字符串是否以某个子字符串开头
- EndsWith 判断某个字符串是否以某个子字符串结尾
- Includes 判断字符串是否包含某个子字符串
- IndexOf 从字符串中搜索某个子字符串的位置，如果搜索不到返回0
- IndexOfAll 获取所有子字符串的位置，返回一个数组
- lastIndexOf 从右边开始搜索
- Trim 删除字符串两边的空白或自定义字符集
- TrimLeft 删除字符串左边
- TrimRight 删除字符串右边
- CharCodeAt 获取字符串某个字符的code码
- CodeAt CharCodeAt的别名
- Wrap 使用某个字符串包裹另一个字符串
- ToString 打印字符串的表示
- Replace 字符串替换
- ToCode 返回整个字符串的编码表示，这是将所有字符编码拼接之后的数字表示
- ToCodes 返回对应字符串的字符编码数组
- ToLower 返回小写
- ToUpper 返回大写
- ToTitle 返回标题形式
- Format 字符串模板 {1}
- Templ 字符串模板 {变量名}
- Reverse 翻转字符串

## 字符串相关操作

### 取值操作

`str[index]` 取字符串索引

`str[start, end]` 取字符串范围

### 循环操作

```
for char in str {
	; char
}
```

## 数组相关方法

- Join 将一个数组连接成字符串,默认以逗号连接
- Map 遍历数组并返回一个新数组,可用来修改数组的每一项
- Filter 过滤数组,返回一个过滤后的新数组
- ForEach 遍历数组返回数组自身
- Shift  删除数组的第一个元素或从第一个开始的多个元素, 如果只删除一个元素则返回该元素, 删除多个则返回被删除元素组成的数组,该函数改变数组自身
- UnShift 向数组头部添加多个元素,并返回原数组,该方法改变自身
- Concat 将多个数组连接成一个新数组并返回
- Every 传入一个函数, 数组每一项带入执行, 返回值全部为真则返回真, 否则为假
- Some 传入一个函数, 数组的每一项带入执行, 有一个返回值为真则返回真, 否则为假
- Remove 删除数组的某项一次或多次, 并返回原数组, 该函数改变自身
- RemoveAll 传入一个待删除元素组成的数组, 从原数组中删除这些项, 返回原数组
- Find 传入一个函数, 找到结果为真的第一个数组项并返回
- FindAll 传入一个函数, 返回结果为真的所有项组成的新数组
- Includes 查看value是否在数组内部
- IndexOf 查看value在数组中的位置
- IndexOfAll 传入一个值或函数返回匹配到的项对应索引组成的新数组
- Flat 数组扁平化
- Unique 数组去重
- Sort 数组排序
- Intersect 取多个数组的交集
- Union 数组并集
- Xor 排除所有数组共有元素, 剩余元素组成新的数组

## 对象相关方法

* Keys 获取对象的key组成的数组
* Values 获取对象的Value组成的数组
* Items 获取对象的key value对组成的数组 `[ { key: "a", value: 1 }, { key: "b", value: 2 }, { key: "c", value: 3 } ]`
* ToString 对象字符串表示形式
* Length 对象长度，这是一个属性
* Has 查看是否有某个属性
* Contains 查看是否有某个属性
* Merge 合并多个对象
