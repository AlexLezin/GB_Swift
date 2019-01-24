// 1. Написать функцию, которая определяет, четное число или нет.

func evenNum(_ num: Int) -> Bool {
    var res: Bool
    if num % 2 == 0 {
        res = true
        return res
    } else {
        res = false
        return res
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func tripleNum(_ num: Int) -> Bool {
    var res: Bool
    if num % 3 == 0 {
        res = true
        return res
    } else {
        res = false
        return res
    }
}

// 3. Создать возрастающий массив из 100 чисел.

var arr = [Int]()

func fillArr (_ start: Int, _ count: Int, _ array: inout [Int]) -> [Int] {
    for i in start...start + count {
        array.append(i)
    }
    return array
}

fillArr(1, 100, &arr)

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func cleanArrByDivider(_ divider: Int, _ array: inout [Int]) -> [Int] {
    for num in array {
        if num % divider == 0 {
            array.remove(at: array.index(of: num)!)
        }
    }
    return array
}

cleanArrByDivider(2, &arr)
cleanArrByDivider(3, &arr)

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func fibo(_ qnt: Int) -> [Int] {
    var n1 = 0
    var n2 = 1
    var ni = 0
    var seq = [n1, n2]
    for _ in 1...qnt - 2 {
        ni = n1 + n2
        seq.append(ni)
        n1 = n2
        n2 = ni
    }
    return seq
}

// 6. * Заполнить массив из 100 элементов различными простыми числами.

func primeAr(_ qnt: Int) -> [Int] {
    var parr = [2]
    while parr.count < qnt {
        let num = parr.last! + 1
        fillArr(num, 100, &parr)
        for i in parr {
            for j in parr {
                if j % i == 0 && j != i {
                    parr.remove(at: parr.index(of: j)!)
                }
            }
        }
    }
    if parr.count > qnt {
        while parr.count > qnt {
            parr.removeLast()
        }
    }
    return parr
}

print(primeAr(100))

