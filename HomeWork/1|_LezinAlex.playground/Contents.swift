import Darwin

print("Let's solve some quadratic equation:")
var x1: Float = 0
var x2: Float = 0

let a: Float = -1
let b: Float = 2
let c: Float = 9

let d: Float = pow(b, 2) - 4*a*c

if (d > 0) {
    x1 = (-b + sqrt(d))/(2*a)
    x2 = (-b - sqrt(d))/(2*a)
    print("Two roots: x1 =", x1,"; x2 =", x2)
} else if (d == 0) {
    x1 = -(b/(2*a))
    x2 = x1
    print("One (double) root: x1 = x2 =", x1)
} else {
    print ("Looks like there are no real roots.")
}

let equ1 = Int(pow(x1, 2) * a + x1 * b + c)
let equ2 = Int(pow(x2, 2) * a + x2 * b + c)

if (equ1 == 0 && equ2 == 0) {
    print("Succes! Roots was proven.")
} else {
    print("Something gone wrong or discriminant was negative")
}

print() //to separate the code's blocks

print("Let's do some geometry:")
let cath1: Float = 2
let cath2: Float = 3

let hyp = sqrt(pow(cath1, 2) + pow(cath2, 2))
print("Hypotenuse is", hyp)

let area = cath1*cath2/2
print("Area is", area)

let perim = cath1 + cath2 + hyp
print("Perimeter is", perim)

print() //to separate the code's blocks

print("Let's do some banking:")

let initsum: Float = 450_000
let interest: Float = 0.05
let term: Float = 5

let prin: Float = initsum * pow((1 + interest), term)
print("With initial sum of $", initsum, "and", interest*100, "% interest you will earn $", prin, "in", term, "years")
