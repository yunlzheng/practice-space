// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello World")

// var定义变量， let定义常量
var myVariable = 24
myVariable = 50

let myConstant = 42

let implictInteger = 70

let implictDouble = 70.0

let explictDouble:Double = 70.0

let explictFloat:Float = 70.0

print(explictFloat)

let label = "This is label"
let width = 94

let labelWidth = label + String(width)

print(labelWidth)


let apples = 3
let oranges = 5

let summaryApple = "I am \(apples) apples"
let summaryOranges = "I have \(oranges) oranges"


let shoppingList = ["catFish", "water", "tulips"]

shoppingList[0]
shoppingList[1]
shoppingList[2]

var occupations = [
    "one": 1,
    "two": 2,
    "three": 3
]

occupations["one"]

let emptyArray = [String]()
let emptyDictority = [String:Float]()


var shoppingList2 = []
var occupations2 = [:]

let individualScores = [75, 10, 20, 30, 45]


var tearmSocre = 0

for score in individualScores{
    
    if (score > 50) {
        tearmSocre += 3
    }else{
        tearmSocre += 1
    }
    
}

print(tearmSocre)


var optionalString: String? = "Hello"

print(optionalString == nil)

var optioallName: String? = "Yunlong"

var greeting = "Hello,"

if let name = optioallName {
    
    greeting = "hello \(name)"
    
}else {
    greeting = "he default"
}

print(greeting)

let vegetable = "red paper"

switch vegetable{
    
    case "celery":
        let vegetableComment = "Add some raisins and make ants a dog"
    case let x where x.hasSuffix("paper"):
        let vegetableComment = "Add some paper in dog"
    default:
        let vegetableComment = "Everything task good in soup"
    
}

let interstingNumbers = [
    
    "Prime": [2,3,4,5,6,7,8],
    "Suare": [1,4,8,12,13]
    
]

var largest = 0
var largestKind = ""

for (kind, numbers) in interstingNumbers {
    
    for num in numbers {
        
        if (num > largest) {
            
            largest = num
            largestKind = kind
            
        }
        
    }
    
}

print("\(largestKind) is the largest number with: \(largest)")

var n = 2

while n<100 {
    
    n = n*2
    
}

print(n)

var m = 10

do {
    m += 10
} while m < 100

print(m)


var firstLoop = 0

for i in 0..<4 {
    
    firstLoop += i
    
}

print(firstLoop)

var secondLoop = 0

for var i=0;i<4;i++ {
    
    secondLoop += i
    
}

print(secondLoop)


func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)"
}

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
        
    }
    
    return (min, max, sum)
    
}

let statics = calculateStatistics([5,3,100,3,9])
print(statics.sum)
print(statics.2)


func sumOf(numbers: Int...) -> Int {
    
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
    
}


sumOf()
sumOf(42, 597,12)


// 函数可以嵌套

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y+=5
    }
    add()
    return y
}

returnFifteen()

// 函数可以作为返回值

func makeincremenenter() -> (Int -> Int){

    func addOne(number: Int) -> Int {
        return 1 + number;
    }
    
    return addOne
    
}

var increment = makeincremenenter()

increment(7)

// 函数可以作为参数传入另外一个函数

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThatThen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(numbers, lessThatThen)

// 函数实际上是一种特殊的闭包，你可以使用{}创建一个匿名壁报

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

// 如果壁报的类型已知，可以忽略参数的类型和返回值

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

// 可以通过参数位置而不是参数名字来引用参数

let sortedNumbers = sorted(numbers) { $0 > $1}
print(sortedNumbers)

// 使用class和类名来创建一个类

class Shape {
    
    var numberOfSides = 0
    let message = "Hello Wolrd!"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func sayHi(name: String) -> String{
        return "Hello \(name)."
    }
    
    
}

// 类名加上括号创建一个类的实例

var shape = Shape()
shape.numberOfSides = 7

var shapeDescription = shape.simpleDescription()

// 类的构造函数

class NamedShape {
    
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}


// 定义子类的方法，在类名后面加上父类的名字，用冒号分割
// 子类如果要重写父类的方法，需要使用override标记

class Square: NamedShape {
    
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
    
}

let test = Square(sideLength: 5.2, name: "My test square")

test.area()
test.simpleDescription()

// 属性可以有getter 和 setter

class EqualateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equailateral triagle with sides of length \(sideLength)"
    }
    
    
}

var triangle = EqualateralTriangle(sideLength: 3.1, name: "A TRIANGLE")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// 需要在设置一个新值得之前或者之后运行代码，willSet, didSet

class TriangleAndSquare{
    
    var triangle: EqualateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String){
        
        square = Square(sideLength: size, name: name)
        triangle = EqualateralTriangle(sideLength: size, name: name)
        
    }
    
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test")

triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength

triangleAndSquare.square = Square(sideLength: 20, name: "new square")
triangleAndSquare.triangle.sideLength


class Counter {
    
    var count: Int = 0
    
    func incrementBy(amount: Int, numberOfTime times: Int) -> Int{
        return amount * times
    }
    
}

var counter = Counter()

counter.incrementBy(10, numberOfTime: 20)

// 处理变量可选值时，可以在操作之前加？，如果?之前的值为nil ? 后面的值会被忽略，并且整个表达式返回nil。否则?之后的东西会被运行

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optionalSquare")
let sideLength = optionalSquare?.sideLength


// 用enum定义一个枚举类

enum Rank: Int {
    
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queue, King
    func simpleDescription() -> String{
        
        switch self{
            
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queue:
            return "queue"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
        
    }
    
}

let ace = Rank.Ace.simpleDescription()
let four = Rank.Four.simpleDescription()

func biggerRank(one: Rank, two: Rank) -> Rank{
    
    if one.rawValue > two.rawValue {
        return one
    }else{
        return two
    }
    
}


// 使用rawValue在原值和枚举值之间转换

if let rank = Rank(rawValue: 3) {
    let descrption = rank.simpleDescription()
}

// 枚举的成员值是真实值，并不是原始值的另外一种表现

enum Suit{
    
    case Spaders, Headers, Clubs
    
    
    func simpleDescription () -> String{
        
        switch self {
        case .Spaders:
            return "clubs"
        case .Headers:
            return "headers"
        case .Clubs:
            return "spaders"
        }
    }
    
    func color () -> String {
        switch self {
        case .Spaders:
            return "red"
        case .Headers, .Clubs:
            return "black"
        }
    }
    
    
    
}

let suit = Suit.Headers.simpleDescription()
let color = Suit.Clubs.color()

// 使用struct创建结构体, 结构体传值，类传引用

struct Card {

    var rank: Rank
    var suit: Suit
    
    func simpleDescrption() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}

var card = Card(rank: Rank.Four, suit: Suit.Clubs)

card.simpleDescrption()

// 一个枚举成员的实例可以有实例值， 相同枚举成员的实例可以有不同的值，创建实例的时候传入值即可

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("aaa", "bbb")
let failure = ServerResponse.Error("error")

switch success {

default:
    let serverResponse = "404"
    
}

// 使用protocol定义一个协议

protocol ExampleProtocol{
    
    var simpleDescription: String { get }
    mutating func adjust()
    
    
}

// 类，枚举和结构体都可以实现协议

class SimpleClass: ExampleProtocol{
    
    var simpleDescription:String = "A very simple class"
    var anotherProperty: Int = 68123
    
    func adjust(){
        simpleDescription += "Now 100% adjust"
    }
    
}

var a = SimpleClass()
a.adjust()
a.simpleDescription

struct SimpleStruct:ExampleProtocol {
    
    var simpleDescription: String = "A very simple struct"
    mutating func adjust() {
        simpleDescription += " (adjust)"
    }
    
}

var b = SimpleStruct()
b.adjust()
b.simpleDescription

// 使用extenstion为现有的类添加功能

extension Int: ExampleProtocol {
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    
}

7.simpleDescription
//7.adjust()

// 可以使用其他命名类型一样使用协议名

let potocolValue: ExampleProtocol = a
potocolValue.simpleDescription

// 泛型 在尖括号里写一个名字来创建一个泛型函数或者类型

func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType]{
    
    var result = [ItemType]()
    for i in 0..<times {
        result.append(item)
    }
    return result
    
}

// 也可以创建泛型类，枚举和结构体

enum OptionalValue<T> {
    
    case None
    case Some(T)
    
}

var possibleInteger: Optional<Int> = .None
possibleInteger = .Some(100)

// 在类型名后使用where来指定对类型的需求

func anyCommentElements <T,U where T: ExampleProtocol>(){

    
    
}

func anyCommentElements2 <T: ExampleProtocol>() {
    
    
    
}




