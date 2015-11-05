import Foundation
import SwiftyJSON

public struct WithUnion: JSONSerializable, DataTreeSerializable, Equatable {
    
    public let value: Union?
    
    public init(
        value: Union?
    ) {
        self.value = value
    }
    
    public static func readJSON(json: JSON) -> WithUnion {
        return WithUnion(
            value: json["value"].json.map { Union.readJSON($0) }
        )
    }
    public func writeJSON() -> JSON {
        return JSON(self.writeData())
    }
    public static func readData(data: [String: AnyObject]) -> WithUnion {
        return readJSON(JSON(data))
    }
    public func writeData() -> [String: AnyObject] {
        var dict: [String : AnyObject] = [:]
        if let value = self.value {
            dict["value"] = value.writeData()
        }
        return dict
    }
}
public func ==(lhs: WithUnion, rhs: WithUnion) -> Bool {
    return (
        (lhs.value == nil ? (rhs.value == nil) : lhs.value! == rhs.value!) &&
        true
    )
}