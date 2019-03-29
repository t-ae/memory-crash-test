/// Broadcast two arrays.
public func broadcast(_ lhs: NDArray, _ rhs: NDArray) -> (NDArray, NDArray) {
    print("broadcast: start")
    defer { print("broadcast: end") } 
        
    if lhs.shape == rhs.shape {
        return (lhs, rhs)
    }
    
    var (lhs, rhs) = (lhs, rhs)
    
    let d = lhs.shape.count - rhs.shape.count
    if d < 0 {
        lhs.shape = [Int](repeating: 1, count: -d) + lhs.shape
        lhs.strides = [Int](repeating: 0, count: -d) + lhs.strides
    } else if d > 0 {
        rhs.shape = [Int](repeating: 1, count: d) + rhs.shape
        rhs.strides = [Int](repeating: 0, count: d) + rhs.strides
    }
    
    // No crash if these are commented in
//    precondition(rhs.strides.count >= 0)
    
    for i in 0..<lhs.shape.count {
        if lhs.shape[i] == rhs.shape[i] {
            continue
        } else if lhs.shape[i] == 1 {
            lhs.shape[i] = rhs.shape[i]
            lhs.strides[i] = 0
        } else if rhs.shape[i] == 1 {
            rhs.shape[i] = lhs.shape[i]
            rhs.strides[i] = 0
        } else {
            preconditionFailure("Can't broadcast: \(lhs.shape) and \(rhs.shape)")
        }
    }
    
    return (lhs, rhs)
}
