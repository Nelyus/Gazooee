import XCTest
//@testable import Gazooee
import func Gazooee.log

class GazooeeTests: XCTestCase {
    func testSanity() {
//        Gazooee.log(<#T##level: Level##Level#>, <#T##value: (Any)##(Any)#>)
        log(.debug, "this is debug")
        log(.info, "this is info")
        log(.warn, "this is warn")
        log(.error, "this is error")
    }

    static var allTests : [(String, (GazooeeTests) -> () throws -> Void)] {
        return [
            ("testSanity", testSanity),
        ]
    }
}
