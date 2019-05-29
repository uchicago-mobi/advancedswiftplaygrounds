import UIKit

func putTogether(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func putTogether(_ a: String, _ b: String) -> String {
    return a + b
}

putTogether(1, 1)
putTogether("Hello ", "World")

func putTogether<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

putTogether(1.5, 2.5)
