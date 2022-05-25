import UIKit
import Darwin

var greeting = "Hello, playground"

var var1:Int!=9
var var2:Int?=3
var var3 = var1+var2!
//！可直接取 ？要解包裝
var x:String?="Hello World"
if let y=x{
    print(y)
    print(x!)// x
}
var x2:String?="Hi" // "Hi"
if let y=x2{
    print("has a Value = \(y)")
}else{
    print("Error! no value")
}
var score:Int?=90
var testScore = score ?? 60
score = nil
testScore = score ?? 60


//add in 0413
for i in stride(from: 0.5, through: 15.25, by: 0.3){
    print(i)
}

//tuple is pass by value not reference
let x3 :(String,Int,Double) = ("hello",5,0.85) // the type of x3 is a tuple

let(word,number,value) = x3

print(word)
print(number)
print(value)

//同上
let x4 :(word:String,number:Int,value:Double) = ("hello",5,0.85) // the type of x3 is a tuple

print(x4.word)
print(x4.number)
print(x4.value)

let(wrd,num,val) = x4

func getSize()->(weight:Double,height:Double){ //return tuple
    return(250,80)
}

let x5=getSize()
print("weight is \(x5.weight)")
print("height is \(x5.height)")
print(getSize().height)


// enum
enum FastFoodMenuItem{
    case humburger(numberOfPattise:Int)
    case fries(size:FryOrderSize)
    case drink(String,ounces:Int)
    case cookie
    mutating func switchToBeingACookie(){
        self = .cookie
    }
}
enum FryOrderSize{
    case large
    case small
}

//let menuItem:FastFoodMenuItem = FastFoodMenuItem.fries(size:.large)
//let menuItem:FastFoodMenuItem = FastFoodMenuItem.fries(size: FryOrderSize.large)
//let menuItem = FastFoodMenuItem.humburger(numberOfPattise: 2)
let menuItem:FastFoodMenuItem = .drink("Coke", ounces: 32)
var otherItem:FastFoodMenuItem = FastFoodMenuItem.cookie
//var otherItem:FastFoodMenuItem = cookies

switch menuItem{
    case .humburger(let pattyCount):
        print("a burger with \(pattyCount) patties")
    case .fries(let size):
        print("yummy")
        print("fries")
        print("a \(size) order of fries!")
    case FastFoodMenuItem.drink(let brand,let ounces):
        print("drink")
        print("a \(ounces)oz \(brand)")
    case .cookie:
        print(" a cookie")
//    default:print("other")
}
print(menuItem)

// 0425
enum Day{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    

}

func dayType(for day:Day)->String{
    switch day{
    
    case .Saturday ,.Sunday:
        return "Weekend"
    default:
        return "WeekDay"
    }
}

let day1 = dayType(for: Day.Sunday)
print(day1)

// 0427
// optional

//enum Optional<T>{
//    case none
//    case some(<T>)
//}

var indexOfOneAndOnlyFaceUpCard:Int?
// ? declared with optional
//  ??
// return emoji[card.identifier] ?? "?"

var hello : String!
hello = "hello"
print(hello)
// this is not safe

var hello1 : Optional<String> = .none
switch hello1{
case .none:
    print("none")
case .some(let data):
    print(data)
}
/*
let x6:String? = "x"
let y = x6?.foo()?.bar?.z
switch x6{
case.none:y=nil
case.some(let detal):
    switch detal.foo(){
    case.none :y = nil
    case.some(let data2):
        switch data2.bar{
        case.none : y = nil
        case.some(let data3):y=data3.z
        }
    }
}
*/

protocol Moveable{
    mutating func move(to point:CGPoint)
}

class Car:Moveable{
    func move(to point:CGPoint){}
    func changeOil(){}
}

struct Shape :Moveable{
    mutating func move(to point:CGPoint){}
    func draw(){}
}

let prius:Car=Car()

let square:Shape = Shape()

var thingToMove:Moveable=prius
//thingToMove.move(to: ...)

//thingToMove.changeOil()   this is no work
thingToMove = square
let thingsToMove:[Moveable]=[prius,square]

func slide(_slide:Moveable){
//    let positionToSlideTo =...
}



protocol Movable {
    var x: Int { get set }
    var y: Int { get set }
    func move(x: Int, y: Int)
}

class Point: Movable {
    var x: Int = 0
    var y: Int = 0

    func move(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

var point: Movable = Point()    //return: {x 0 y 0}
point.move(x: 10, y: 20)
point                           //return: {x 10 y 20}


// dictionary

// var emojiDic[Int:String]()
protocol Hashtable : Equatable{
    var hashValue:Int{get}
}

//0502
func hello(closure:(String) -> Void ){
    closure("Tim")
}

func test(name:String){
    print(name)
}
hello{ name in
    
}
