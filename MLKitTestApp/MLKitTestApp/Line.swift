//
//  Line.swift
//  Minutes
//
//  Created by Sergii Sopin on 2021-10-14.
//

import Foundation
import MLKit

struct Line: Codable {
    var strokes: [SerializableStroke] = []
    var text: String = ""
    
    public init() {
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(NSKeyedArchiver.archivedData(withRootObject: SwiftInk(base: SerializableInk(strokes: strokes)), requiringSecureCoding: false), forKey: .strokes)
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.strokes = try values.decode(SwiftInk.self, forKey: .strokes).wrapped.strokes as? [SerializableStroke] ?? []
    }

    enum CodingKeys: String, CodingKey {
        case strokes
    }
}
