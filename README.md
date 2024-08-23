# ahk-standard-lib

autohotkey语言的标准库,目标是提供更好的数据结构操作体验.项目开源,欢迎参与.

## 字符串相关方法

- Split 切割字符串返回一个数组
- Length 返回字符串的长度
- StartsWith 判断字符串是否以某个子字符串开头
- EndsWith 判断某个字符串是否以某个子字符串结尾
- Includes 判断字符串是否包含某个子字符串
- IndexOf 从字符串中搜索某个子字符串的位置，如果搜索不到返回0
- Trim 删除字符串两边的空白或自定义字符集
- TrimLeft
- TrimRight
- CharCodeAt 获取字符串某个字符的code码
- Wrap 使用某个字符串包裹另一个字符串
- ToString 打印字符串的表示
- Replace 暂未实现
- ToCode 返回整个字符串的编码表示

## 字符串相关操作

### 取值操作

`str[index]`

`str[start, end]`

### 循环操作

```
for char in str {
	; char
}
```

## 数组相关方法

- Join
- Map
- Filter
- Shift
- UnShift
- Concat
- Every
- Some
- Remove
- Find
- FindAll
- Contains
- Includes
- IndexOf
- IndexOfAll
- Flat
- Unique
- Sort
