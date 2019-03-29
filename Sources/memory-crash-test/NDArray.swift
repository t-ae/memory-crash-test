public struct NDArray {
    /// Shape of NDArray.
    public internal(set) var shape: [Int]
    
    /// Strides for each dimensions.
    public internal(set) var strides: [Int]
    
    init(shape:[Int], strides: [Int]) {
        self.shape = shape
        self.strides = strides
    }
    
    /// Create contiguous NDArray.
    public init(shape: [Int]) {
        self.init(shape: shape,
                  strides: getContiguousStrides(shape: shape))
    }
}

/// Get contiguous strides.
func getContiguousStrides(shape: [Int]) -> [Int] {
    guard !shape.isEmpty else {
        return []
    }
    var stride = 1
    var strides = [Int](repeating: 1, count: shape.count)
    for (i, s) in shape.dropFirst().reversed().enumerated() {
        stride *= s
        strides[shape.count-i-2] = stride
    }
    return strides
}
