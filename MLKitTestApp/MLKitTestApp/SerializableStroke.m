//
//  SerializableStroke.m
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-06.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SerializableStroke.h"
#import "SerializableStrokePoint.h"

@implementation SerializableStroke

#pragma mark NSCoding

#define kPointsKey       @"Points"
    
-(NSArray<SerializableStrokePoint *> *) serilizablePoints {
    return (NSArray<SerializableStrokePoint *> *) self.points;
}

+ (BOOL)supportsSecureCoding {
  return YES;
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: (SerializableStrokePoint*)super.points forKey:kPointsKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSArray<SerializableStrokePoint *> *pnts = [decoder decodeObjectOfClass:SerializableStroke.class forKey: kPointsKey];
    return [super initWithPoints:pnts];
}

@end
