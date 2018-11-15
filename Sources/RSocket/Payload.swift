import NIO

public protocol Payload {

    var hasMetadata: Bool { get }

    var metadata: ByteBuffer { get }

    var data: ByteBuffer { get }
}

extension ByteBuffer {
    func readString() -> String {
        var buffer = self
        guard let string = buffer.readString(length: buffer.readableBytes) else {
            return ""
        }
        return string
    }
}

public extension Payload {

    var metadataAsString: String {
        get {
            return metadata.readString()
        }
    }

    var dataAsString: String {
        get {
            return data.readString()
        }
    }
}
