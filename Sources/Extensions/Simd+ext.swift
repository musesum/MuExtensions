// created by musesum on 12/22/23

import simd

public extension SIMD2<Float> {

    func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)))"
    }
    var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)))"
    }
}
public extension SIMD3<Float> {

    func hash(_ max: Float) -> Scalar {
        let h = ((x+max) * max * max) + ((y+max) * max) + (z + max)
        return h
    }
    func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)))"
    }
    var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)))"
    }
}
public extension SIMD4<Float> {

    func hash(_ max: Float) -> Scalar {
        let h = ((x+max) * max * max) + ((y+max) * max) + (z + max)
        return h
    }
    func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)),\(w.digits(range)))"
    }
    var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)),\(w.digits(-1)))"
    }
    var xyz: SIMD3<Scalar> {
        SIMD3(x, y, z)
    }
}
public extension SIMD4<Double> {

    func script(_ range: Int) -> String {
        "(\(x.digits(range)),\(y.digits(range)),\(z.digits(range)),\(w.digits(range)))"
    }
    var script: String {
        "(\(x.digits(-1)),\(y.digits(-1)),\(z.digits(-1)),\(w.digits(-1)))"
    }
    var xyz: SIMD3<Scalar> {
        SIMD3(x, y, z)
    }
}
public extension simd_float4x4 {

    func script(_ range: Int) -> String {
        return "(\(columns.0.script(range)), \(columns.1.script(range)), \(columns.2.script(range)), \(columns.3.script(range)))"
    }
    var script: String {
        return "(\(columns.0.script), \(columns.1.script), \(columns.2.script), \(columns.3.script))"
    }
}
public extension simd_double4x4 {

    func script(_ range: Int) -> String {
        return "(\(columns.0.script(range)), \(columns.1.script(range)), \(columns.2.script(range)), \(columns.3.script(range)))"
    }
    var script: String {
        return "(\(columns.0.script), \(columns.1.script), \(columns.2.script), \(columns.3.script))"
    }
}
public func perspective4x4(_ aspect: Float,
                           _ fovy  : Float,
                           _ nearZ : Float,
                           _ farZ  : Float) -> matrix_float4x4 {

    let yScale  = 1 / tan(fovy * 0.5)
    let xScale  = yScale / aspect
    let zRange  = farZ - nearZ
    let zScale  = -(farZ + nearZ) / zRange
    let wzScale = -farZ * nearZ / zRange
    let P = vector_float4([ xScale, 0, 0, 0  ])
    let Q = vector_float4([ 0, yScale, 0, 0  ])
    let R = vector_float4([ 0, 0, zScale, -1 ])
    let S = vector_float4([ 0, 0, wzScale, 0 ])

    let mat = matrix_float4x4([P, Q, R, S])
    return mat
}

public func translation(_ t: vector_float4) -> matrix_float4x4 {
    let X = vector_float4([  1,  0,  0,  0 ])
    let Y = vector_float4([  0,  1,  0,  0 ])
    let Z = vector_float4([  0,  0,  1,  0 ])
    let W = vector_float4([t.x,t.y,t.z,t.w ])

    let mat = matrix_float4x4([X,Y,Z,W])
    return mat
}
