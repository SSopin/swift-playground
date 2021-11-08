//
//  DSFKeyedArchiverCodable.swift
//  QR Generator
//
//  Created by Darren Ford on 18/11/19.
//  Copyright © 2019 Darren Ford. All rights reserved.
//
import Foundation

/// A wrapper class for those base object types that does not currently conform to
/// Codable, but DOES conform to NSCoding/NSSecureCoding.
///
/// Uses NSKeyedArchiver to encode and decode the wrapped object type in a binary data form
///
/// Usage:
///
///   `typealias NSColor_Codable = DSFKeyArchiverCodable<NSColor>`
public class DSFKeyArchiverCodable<BaseType>: NSObject, Codable where BaseType: NSSecureCoding {

    public init(base: BaseType) {
        self.wrapped = base
    }
    
   /// The error thrown when a color could not be converted
   let errCouldNotDecode: NSError = {
      return NSError(domain: NSCocoaErrorDomain, code: -1, userInfo: [
         NSLocalizedDescriptionKey: "Unable to decode object",
      ])
   }()

   private enum CodingKeys: String, CodingKey { case wrapped }

   /// The wrapped object
   var wrapped: BaseType

   public required init(from decoder: Decoder) throws {
      let data = try decoder.container(keyedBy: CodingKeys.self)
      let codingData = try data.decode(Data.self, forKey: .wrapped)
      guard let wrapped = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codingData) as? BaseType else {
         throw errCouldNotDecode
      }

      self.wrapped = wrapped
   }

   public func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      let data: Data

      #if os(macOS)
      if #available(macOS 10.13, *) {
         data = try NSKeyedArchiver.archivedData(withRootObject: self.wrapped, requiringSecureCoding: true)
      } else {
         data = NSKeyedArchiver.archivedData(withRootObject: self.wrapped)
      }

      #else

      data = try NSKeyedArchiver.archivedData(withRootObject: self.wrapped, requiringSecureCoding: true)

      #endif
      try container.encode(data, forKey: .wrapped)
   }
}
