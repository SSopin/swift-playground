//
//  CodableStrokePoint.swift
//  MLKitTestApp
//
//  Created by Sergii Sopin on 2021-11-02.
//

import Foundation
import MLKitDigitalInkRecognition

class CodableStrokePoint: StrokePoint, Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.x, forKey: .x)
        try container.encode(self.y, forKey: .y)
        try container.encode(self.t!.intValue, forKey: .t)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let _x = try values.decode(Float.self, forKey: .x)
        let _y = try values.decode(Float.self, forKey: .y)
        let _t = try values.decode(Int.self, forKey: .t)
        self.init(x: _x, y: _y, t: _t)
    }

    enum CodingKeys: String, CodingKey {
        case x
        case y
        case t
    }
}
