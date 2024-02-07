// created by musesum on 12/22/23

import simd

extension SIMD2<Float> {
    public func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)))"
    }
    public var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)))"
    }
}
extension SIMD3<Float> {
    public func hash(_ max: Float) -> Scalar {
        let h = ((x+max) * max * max) + ((y+max) * max) + (z + max)
        return h
    }
    public func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)))"
    }
    public var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)))"
    }
}
extension SIMD4<Float> {
    func hash(_ max: Float) -> Scalar {
        let h = ((x+max) * max * max) + ((y+max) * max) + (z + max)
        return h
    }
    public func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)),\(w.digits(range)))"
    }
    public var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)),\(w.digits(-1)))"
    }
}
extension SIMD4<Double> {
    
    public func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)),\(w.digits(range)))"
    }
    public var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)),\(w.digits(-1)))"
    }
    public var xyz: SIMD3<Scalar> {
        SIMD3(x, y, z)
    }
}


extension simd_float4x4 {

    public func script(_ range: Int) -> String {
        return "(\(columns.0.script(range)), \(columns.1.script(range)), \(columns.2.script(range)), \(columns.3.script(range)))"
    }
    public var script: String {
        return "(\(columns.0.script), \(columns.1.script), \(columns.2.script), \(columns.3.script))"
    }
}
extension simd_double4x4 {
    public func script(_ range: Int) -> String {
        return "(\(columns.0.script(range)), \(columns.1.script(range)), \(columns.2.script(range)), \(columns.3.script(range)))"
    }
    public var script: String {
        return "(\(columns.0.script), \(columns.1.script), \(columns.2.script), \(columns.3.script))"
    }
}
