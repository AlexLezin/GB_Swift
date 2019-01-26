//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<T: Equatable> {
    private var elements: [T] = []
    mutating func push(_ elts: T...) {
        for i in elts {
            elements.append(i)
        }
    }
    mutating func pop() -> T? {
        return elements.removeFirst()
    }
    mutating func filter(_ by: T) {
        for element in elements {
            if element != by {
                elements.remove(at: elements.index(of: element)!)
            }
        }
    }
    mutating func size() -> Int {
        var count = 0
        for _ in elements {
            count += 1
        }
        return count
    }
    subscript(ind: Int) -> T? {
        if ind > elements.index(of: elements.last!)! {
            return nil
        } else {
            return elements[ind]
        }
    }
}

var newQ = Queue<Int>()

newQ.push(4, 6, 4, 6, 7, 3, 6, 4, 7, 3)

newQ.size()

newQ[10]
