import Foundation
import SwiftyJSON

public struct DefaultLiteralEscaping: JSONSerializable, DataTreeSerializable {
    
    public let stringField: String?
    
    public init(
        stringField: String? = "quote: \", backslash: \\ slash: / backspace: \u{8} formfeed: \u{C} newline: \n carrage return: \r tab: \t unicode-of-ascii: B unicode-out-of-range: \u{2713}"
    ) {
        self.stringField = stringField
    }
    
    public static func readJSON(json: JSON) -> DefaultLiteralEscaping {
        return DefaultLiteralEscaping(
            stringField: json["stringField"].string
        )
    }
    public func writeJSON() -> JSON {
        return JSON(self.writeData())
    }
    public static func readData(data: [String: AnyObject]) -> DefaultLiteralEscaping {
        return readJSON(JSON(data))
    }
    public func writeData() -> [String: AnyObject] {
        var dict: [String : AnyObject] = [:]
        if let stringField = self.stringField {
            dict["stringField"] = stringField
        }
        return dict
    }
}