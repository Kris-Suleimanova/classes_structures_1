// Родительский класс
class Parent {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printInfo() {
        print("Имя родителя: \(name)")
    }
}

// Дочерний класс 1
class Child1: Parent {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
    
    override func printInfo() {
        print("Имя ребенка: \(name), Возраст: \(age)")
    }
}

// Дочерний класс 2
class Child2: Parent {
    var grade: Int
    
    init(name: String, grade: Int) {
        self.grade = grade
        super.init(name: name)
    }
    
    override func printInfo() {
        print("Имя ребенка: \(name), Оценка: \(grade)")
    }
}

// Пример использования классов
let parent = Parent(name: "Алексей")
parent.printInfo()

let child1 = Child1(name: "Кирилл", age: 10)
child1.printInfo()

let child2 = Child2(name: "Анна", grade: 5)
child2.printInfo()


// Создаем класс House
class House {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
  func create() {
    print("Площадь = \(width * height)")
  }

    func destroy() {
        print("Дом уничтожен")
    }
}

let printHouse = House(width: 12.0, height: 9.0)
printHouse.create()
printHouse.destroy()


// Сортировка учеников
struct Pupil {
    var name: String
    var course: Int
    var average_grade: Double
}

class StudentsSpecifications {
    func sort(by key: String, students: [Pupil]) -> [Pupil] {
        switch key {
        case "name":
            return students.sorted(by: { $0.name < $1.name })
        case "course":
            return students.sorted(by: { $0.course < $1.course })
        case "average_grade":
            return students.sorted(by: { $0.average_grade < $1.average_grade })
        default:
            return students
        }
    }
}

var pupil = [Pupil]()

let pupil1 = Pupil(name: "Иванов", course: 3, average_grade: 5.00)
let pupil2 = Pupil(name: "Петров", course: 4, average_grade: 3.85)
let pupil3 = Pupil(name: "Ильина", course: 2, average_grade: 3.78)
let pupil4 = Pupil(name: "Кадченко", course: 2, average_grade: 3.78)

pupil.append(pupil1)
pupil.append(pupil2)
pupil.append(pupil3)
pupil.append(pupil4)

let h = StudentsSpecifications()

var sort = h.sort(by: "name", students: pupil)
for student in sort {
    print("Имя: \(student.name), Курс: \(student.course), Средний балл: \(student.average_grade)")
}

sort = h.sort(by: "course", students: pupil)
for student in sort {
    print("Имя: \(student.name), Курс: \(student.course), Средний балл: \(student.average_grade)")
}

sort = h.sort(by: "average_grade", students: pupil)
for student in sort {
    print("Имя: \(student.name), Курс: \(student.course), Средний балл: \(student.average_grade)")
}

// Структура для представления координат точки на плоскости
struct Point {
    var x: Double
    var y: Double
}

// Класс для представления круга на плоскости
class Circle {
    var center: Point
    var radius: Double
    
    init(center: Point, radius: Double) {
        self.center = center
        self.radius = radius
    }
}

let point = Point(x: 3, y: 4)
print("Координаты точки: (\(point.x), \(point.y))")


let circle = Circle(center: Point(x: 1, y: 2), radius: 5)
print("Координаты центра: (\(circle.center.x), \(circle.center.y))")
print("Радиус круга: \(circle.radius)")


// Структуры являются значениями, а классы - ссылочными типами. Это означает, что при работе со структурами они копируются, а при работе с экземплярами классов передаются по ссылке.
// Структуры не могут наследоваться, а классы могут быть унаследованы другими классами.
// В общем случае, если вам нужно создать простую структуру данных, которая хранит небольшое количество значений, лучше использовать структуру. Если же вам нужно создать объект с более сложной логикой и возможностью наследования, целесообразно использовать класс.

// Программа покер
let s = [ "♥️","♠","♦️","♣️"]
let v = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

func generate() -> [(String, String)] {
    var c: [(String, String)] = []
    while c.count < 5 {
        let rS = s.randomElement()!
        let rV = v.randomElement()!
        let newCard = (rS, rV)
        if !c.contains(where: { $0 == newCard }) {
            c.append(newCard)
        }
    }
    return c
}

func P(c: [(String, String)]) -> String {
    let sort = c.sorted {v(for: $0.1) < v(for: $1.1)}
    
    switch (RoyalFlush(c: sort), StraightFlush(c: sort), FourOfAKind(c: sort), FullHouse(c: sort), Flush(c: sort), Straight(c: sort), ThreeOfAKind(c: sort), TwoPair(c: sort), Pair(c: sort)) {
    case (true, _, _, _, _, _, _, _, _):
        return "Флеш Рояль"
    case (_, true, _, _, _, _, _, _, _):
        return "Стрит Флеш"
    case (_, _, true, _, _, _, _, _, _):
        return "Каре"
    case (_, _, _, true, _, _, _, _, _):
        return "Фулл Хаус"
    case (_, _, _, _, true, _, _, _, _):
        return "Флеш"
    case (_, _, _, _, _, true, _, _, _):
        return "Стрит"
    case (_, _, _, _, _, _, true, _, _):
        return "Тройка"
    case (_, _, _, _, _, _, _, true, _):
        return "Две пары"
    case (_, _, _, _, _, _, _, _, true):
        return "Пара"
    default:
        return "Старшая карта"
    }
}

func v(for k: String) -> Int {
    switch k {
    case "A": return 14
    case "K": return 13
    case "Q": return 12
    case "J": return 11
    default: return Int(k) ?? 0
    }
}

func RoyalFlush(c: [(String, String)]) -> Bool {
    let royalValues = Set(["10", "J", "Q", "K", "A"])
    let suit = c[0].0
    return c.allSatisfy { $0.0 == suit && royalValues.contains($0.1) }
}

func StraightFlush(c: [(String, String)]) -> Bool {
    return Straight(c: c) && Flush(c: c)
}

func FourOfAKind(c: [(String, String)]) -> Bool {
    let values = c.map { $0.1 }
    let uniqueValues = Set(values)
    
    for value in uniqueValues {
        if values.filter({ $0 == value }).count >= 4 {
            return true
        }
    }
    
    return false
}

func FullHouse(c: [(String, String)]) -> Bool {
    let values = c.map { $0.1 }
    return Set(values).count == 2 && (values[0] == values[2] || values[2] == values[4])
}

func Flush(c: [(String, String)]) -> Bool {
    return c.allSatisfy { $0.0 == c[0].0 }
}

func Straight(c: [(String, String)]) -> Bool {
    let values = c.map { v(for: $0.1) }.sorted()
    return Set(values) == Set(Array(values[0]...values[0]+4))
}

func ThreeOfAKind(c: [(String, String)]) -> Bool {
    let values = c.map { $0.1 }
    
    for i in 0...(values.count - 3) {
        if values[i] == values[i + 1] && values[i + 1] == values[i + 2] {
            return true
        }
    }
    
    return false
}

func TwoPair(c: [(String, String)]) -> Bool {
    let values = c.map { $0.1 }
    return Set(values).count == 3
}

func Pair(c: [(String, String)]) -> Bool {
    let values = c.map { $0.1 }
    let uniqueValues = Set(values)
    return uniqueValues.count < c.count
}


var t = generate()

print("Комбинация:")
for k in t {
    print("\(k.1) \(k.0)")
}

let m = P(c: t)
print("У вас \(m)")
