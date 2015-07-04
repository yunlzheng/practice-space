// Playground - noun: a place where people can play

// 常量和变量

// 常量的值设置后不可改变，变量可以

let maxNumberOfAttachement = 10
//maxNumberOfAttachement = 20

var currentLoginAttement = 5
currentLoginAttement = 10

// 也可以在一行中声明多个变量
var x = 0.0, y=1, z=0.25

// 类型标注(一般情况下可以不写类型声明，swift可以自动推断)
var welcomeMessage: String = "Weclome to my home pacge"

// 常量和变量的命名（字符串,unicode字符等）
// 常量和变量名不能包含数字符号，箭头，连线，制表符等，不能以数字开头
let pi = 3.141576
let 你好 = "hello"
let 🐂 = "cow"

let 🐷 = "👨👩🐶🐱🌲🈴🐰😊"

for 👨 in Array(🐷) {
 print(👨)
}


// 整数
// 无符号的整数

let minValue = Int.min
let maxValue = Int.max

let uMinValue = UInt.min
let uMaxValue = UInt.max

// 浮点数
let floatValue = 0.0
let doubleValue = 3.14156

// Swift是类型安全的

// 数值型字面量
// 十进制: 无前缀
// 二进制：0b
// 八进制:0o
// 十六进制:ox

let n1 = 12
let n2 = 0b10001
let n3 = 0o8008


// 数值类型转换

// uInt不能存储负数
//let cannotBeNegative:UInt8 = -1

//Int8不能存储超过最大值的数
//let tooBig:Int8 = Int8.max + 1

let twoThousand:UInt16  = 2000
let one:UInt8 = 1

let twoThousandAndOne: UInt16 = twoThousand + UInt16(one)


// 类型别名typealias

typealias sample = UInt

//布尔值 Bool
let truth = true

// 元组（tuples）

let http404error = (404, "Not Found")

// 元组分解

let (statusCode, statusMessage) = http404error

// 可以使用下划线忽略值
let (statusCode2, _) = http404error

print(statusCode)
print(statusMessage)

// 可以使用下表访问元组的元素
print(http404error.0)
print(http404error.1)

// 可选类型











