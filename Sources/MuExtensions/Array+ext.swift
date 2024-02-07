//  created by musesum on 12/20/22.


import Foundation

extension Array where Element == Double {

    public static func - (lhs: [Double], rhs: [Double]) -> [Double] {
        var result = [Double]()
        for index in 0 ..< lhs.count {
            let left = lhs[index]
            let right = index < rhs.count ? rhs[index] : 0
            result.append(left - right)
        }
        return result
    }

    public static func + (lhs: [Double], rhs: [Double]) -> [Double] {
        var result = [Double]()
        for index in 0 ..< lhs.count {
            let left = lhs[index]
            let right = index < rhs.count ? rhs[index] : 0
            result.append(left + right)
        }
        return result
    }
    
    public static func * (lhs: [Double], rhs: [Double]) -> [Double] {
        var result = [Double]()
        for  index in 0 ..< lhs.count {
            let left = lhs[index]
            let right = index < rhs.count ? rhs[index] : 0
            result.append(left * right)
        }
        return result
    }
    
    public static func * (lhs: [Double], rhs: Double) -> [Double] {
        var result = [Double]()
        for  left in lhs {
            result.append(left * rhs)
        }
        return result
    }

    public func distance(_ from: [Double]) -> Double {
        let result = sqrt( (self[0]-from[0]) * (self[0]-from[0]) +
                           (self[1]-from[1]) * (self[1]-from[1]) )
        return result
    }
}
extension Array where Element: Numeric, Element: ExpressibleByIntegerLiteral {

    public static func + (lhs: Array, rhs: Array) -> Array {
        guard lhs.count == rhs.count else {
            fatalError("Arrays must have the same size to be added")
        }

        var result = Array()
        for i in 0..<lhs.count {
            result.append(lhs[i] + rhs[i])
        }
        return result
    }
    
    public static func - (lhs: Array, rhs: Array) -> Array {
        guard lhs.count == rhs.count else {
            fatalError("Arrays must have the same size to be added")
        }

        var result = Array()
        for i in 0..<lhs.count {
            result.append(lhs[i] - rhs[i])
        }
        return result
    }
}
extension Array where Element: FloatingPoint {

    public static func / (lhs: Array, rhs: Element) -> Array {
        return lhs.map { $0 / rhs }
    }
    
    public static func * (lhs: Array, rhs: Element) -> Array {
        return lhs.map { $0 * rhs }
    }
}


extension Array where Element == UInt8 {
    
    public var data: Data {
        return Data(self)
    }
}
extension Array where Element == UInt8 {
    
    public func toAsciiString() -> String? {
        String(bytes: self, encoding: .ascii)
    }
}

extension Array where Element == UInt8 {
    
    public func toString() -> String? {
        String(bytes: self, encoding: .utf8)
    }
}



