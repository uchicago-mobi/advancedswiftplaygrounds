import UIKit

class Candy {
    let name: String
    let expirationDate: Date
    
    init?(name: String, expirationDate: Date) {
        guard expirationDate >= Date() else { return nil }
        
        self.name = name
        self.expirationDate = expirationDate
    }
    
    convenience init?(name: String) {
        self.init(name: name, expirationDate: Date())
    }
}

enum CandyFailure: Error {
    case gross
    case tooMainstream
    case ripInTheSpaceTimeContinuum
}

func select(candy name: String) throws -> Candy? {
    guard name != "licorice" else {
        throw CandyFailure.gross
    }
    
    guard !["M&Ms", "Reese's", "KitKat"].contains(name) else {
        throw CandyFailure.tooMainstream
    }
    
    guard let expirationDate = Calendar.current.date(
            byAdding: .year,
            value: 1,
            to: Date()
        ) else {
            throw CandyFailure.ripInTheSpaceTimeContinuum
    }
    
    return Candy(name: name, expirationDate: expirationDate)
}

try select(candy: "Skittles")

do {
    try select(candy: "Reese's")
} catch (let failure) {
    print(failure)
}
