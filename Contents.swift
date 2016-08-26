//Struct

//Create a Struct

struct User {
    let name: String
    let age: Int
}

//Create an Instance of Struct

struct Book {
    let title: String
    let author: String
    let price: Double
}

let myBook = Book(title: "Animal Farm", author: "George Orwell", price: 6.0)

//Create a Method of Struct

struct Person {
    let firstName: String
    let lastName: String
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

//Create an Instance of Struct and Called the Instance of Method

let aPerson = Person(firstName: "Zulwiyoza", lastName: "Putra")
let fullName = aPerson.getFullName()

//Create Initializer of for The Object

struct RGBColor {
    let red : Double
    let green: Double
    let blue: Double
    let alpha: Double
    let description: String
    
    init() {
        self.red = 86.0
        self.green = 191.0
        self.blue = 131.0
        self.alpha = 1.0
        self.description = "red: 86.0, green: 191.0, blue: 131.0, alpha: 1.0"
    }
    
    func printDescription() -> String {
        return description
    }
}

let anRGBColor = RGBColor()
let printInstance = anRGBColor.printDescription()

//Struct to Struct

struct Tag {
    let name: String
}

struct Post {
    let title: String
    let author: String
    let tag: Tag
    
    init(title: String, author: String, tag: Tag) {
        self.title = title
        self.author = author
        self.tag = tag
    }
    func description() -> String {
        return "\(title) by \(author). Filed under \(tag.name)"
    }
}

let firstPost = Post(title: "iOS Development", author: "Apple", tag: Tag(name: "swift"))

let postDescription = firstPost.description()







//Class

//Create a Class

class Shape {
    var numberOfSides: Int
    
    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
}

let someShape = Shape(numberOfSides: 2)

//Create a Class That Refer to Data in Struct

struct Location {
    let latitude: Double
    let longitude: Double
}

class Business {
    var name: String = "Zulwiyoza Putra"
    var location: Location
    
    init(latitude: Double, longitude: Double) {
        self.location = Location(latitude: latitude, longitude: longitude)
    }
}

let someBusiness = Business(latitude: 12.0, longitude: 13.0)

//Inheritance

class Vehicle {
    var numberOfDoors: Int
    var numberOfWheels: Int
    
    init(withDoors doors: Int, andWheels wheels: Int) {
        self.numberOfDoors = doors
        self.numberOfWheels = wheels
    }
}

class Car: Vehicle {
    var numberOfSeats: Int = 4
    
    override init(withDoors doors: Int, andWheels wheels: Int) {
        super.init(withDoors: doors, andWheels: wheels)
    }
}

let someCar = Car(withDoors: 4, andWheels: 4)

//Inheritance

class Human {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

let aHuman = Human(firstName: "Zulwiyoza", lastName: "Putra")
aHuman.getFullName()

class Doctor: Human {
    override func getFullName() -> String {
        return "Dr. \(lastName)"
    }
}

let someDoctor = Doctor(firstName: "Zulwiyoza", lastName: "Putra")
someDoctor.getFullName()

//Subclassig Class

class anotherPoint {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}


class Machine {
    var location: anotherPoint
    
    init() {
        self.location = anotherPoint(x: 0, y: 0)
    }
    
    func move(direction: String) {
        print("Do nothing! Im a machine!")
    }
}

class Robot: Machine {
    override func move(direction: String) {
        switch direction {
            case "Up": self.location.y = self.location.y + 1
            case "Down": self.location.y = self.location.y - 1
            case "Right": self.location.x = self.location.x + 1
            case "Left": self.location.x = self.location.x - 1
        default:
            break
        }
    }
}

let robot = Robot()
robot.move("Up")
robot.location.y






//Tower Game

//The Point Struct

struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func surroundingPoints(withRange range: Int = 1) -> [Point] {
        var results: [Point] = []
        for xCoordinate in (x-range)...(x+range) {
            for yCoordinate in (y-range)...(y+range) {
                let coordinatePoint =  Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}

let somePoint = Point(x: 1, y: 1)

//The Enemy Class

class Enemy {
    var life: Int
    var position: Point
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
        self.life = 2
    }
    
    func decreaseHealth(factor: Int) -> Void {
        self.life = self.life - factor
    }
}

//The Tower Class

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func inRange(position: Point, range: Int, target: Point) -> Bool {
        let availablePositions = position.surroundingPoints(withRange: range)
        for point in availablePositions {
            if (point.x == target.x) && (point.y == target.y) {
                return true
            }
        }
        return false
    }
    
    func fireAtEnemy(enemy: Enemy) -> Void {
        if inRange(self.position, range: self.range, target: enemy.position) {
            while enemy.life > 0 {
                enemy.decreaseHealth(self.strength)
                print("Enemy life is decreased")
            }
            print("Enemy killed!")
        } else {
            print("Damn! Enemy is out of range!")
        }
    }
}

class SuperEnemy: Enemy {
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.life = 50
    }
}

class LaserTower: Tower {
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    
    override func fireAtEnemy(enemy: Enemy) {
        while enemy.life > 0 {
            enemy.decreaseHealth(strength)
            print("damn that was so sick")
        }
        print("enemy being ultra killed")
    }
}

let tower = Tower(x: 0, y: 0)
let firstEnemy = Enemy(x: 1, y: 1)
let secondEnemy = Enemy(x: 2, y: 2)
let superEnemy = SuperEnemy(x: 20, y: 20)
let laserTower = LaserTower(x: 0, y: 0)

tower.fireAtEnemy(firstEnemy)
tower.fireAtEnemy(secondEnemy)
laserTower.fireAtEnemy(superEnemy)











