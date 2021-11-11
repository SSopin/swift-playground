//
//  Line.swift
//  Minutes
//
//  Created by Sergii Sopin on 2021-10-14.
//

import Foundation
import MLKit

struct Line: Codable {
    var strokes: [Stroke] = []
    var text: String = ""
    
    public init() {
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Ink.init(strokes: strokes).toCodable, forKey: .ink)
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.strokes = try Ink.init(fromCodable: values.decode(Ink.CodableInk.self, forKey: .ink)).strokes
    }

    enum CodingKeys: String, CodingKey {
        case ink
    }
}

//MARK: - Extensions to make Inc codable

extension StrokePoint {
    struct CodableStrokePoint: Codable {
        let x: Float
        let y: Float
        let t: Int
    }
    var toCodable: CodableStrokePoint {
        .init(x: x, y: y, t: t?.intValue ?? 0)
    }
    convenience init(fromCodable pt: CodableStrokePoint) {
        self.init(x: pt.x, y: pt.y, t: pt.t)
    }
}

extension Stroke {
    struct CodableStroke: Codable {
        let points: [StrokePoint.CodableStrokePoint]
    }
    var toCodable: CodableStroke {
        .init(points: points.map {$0.toCodable} )
    }
    convenience init(fromCodable pt: CodableStroke) {
        self.init(points: pt.points.map { StrokePoint.init(fromCodable: $0)} )
    }
}

extension Ink {
    struct CodableInk: Codable {
        let strokes: [Stroke.CodableStroke]
    }
    var toCodable: CodableInk {
        .init(strokes: strokes.map {$0.toCodable} )
    }
    convenience init(fromCodable pt: CodableInk) {
        self.init(strokes: pt.strokes.map { Stroke.init(fromCodable: $0)} )
    }
}
