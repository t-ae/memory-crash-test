import XCTest
import memory_crash_test

final class memory_crash_testTests: XCTestCase {
    func testExample() {
        defer { print("end testExample") }
        let a = NDArray(shape: [])
        let b = NDArray(shape: [1, 3])
        
        let (lhs, rhs) = broadcast(a, b)
        
        XCTAssertEqual(lhs.strides, [0, 0])
        XCTAssertEqual(rhs.strides, [3, 1])
        print("will exit testExample")
    }
}
