import Foundation
import XCTest
import NIO
@testable import RSocket

class Payload_Extension_Test: XCTestCase {

    static var allTests = [
        ("testEmptyPayload", testEmptyPayload),
    ]

    func testEmptyPayload() {
        let payload: EmptyPayload = EmptyPayload()
        XCTAssertEqual("", payload.metadataAsString)
        XCTAssertEqual("", payload.dataAsString)
    }

    struct EmptyPayload: Payload {
        private let allocator = ByteBufferAllocator()
        var hasMetadata: Bool = false
        var metadata: ByteBuffer {
            get {
                return allocator.buffer(capacity: 0)
            }
        }
        var data: ByteBuffer {
            get {
                return allocator.buffer(capacity: 0)
            }
        }
    }

    func testContentPayload() {
        let payload = FullyPayload()
        XCTAssertEqual("foo-bar-test", payload.metadataAsString)
        XCTAssertEqual("foo-bar-data", payload.dataAsString)
    }

    struct FullyPayload: Payload {
        private let allocator = ByteBufferAllocator()
        var hasMetadata: Bool = true
        var metadata: ByteBuffer {
            get {
                var buffer = allocator.buffer(capacity: 30)
                buffer.write(string: "foo-bar-test")
                return buffer
            }
        }
        var data: ByteBuffer {
            get {
                var buffer = allocator.buffer(capacity: 30)
                buffer.write(string: "foo-bar-data")
                return buffer
            }
        }
    }
}
