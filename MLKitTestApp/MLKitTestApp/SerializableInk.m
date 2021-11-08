//
//  SerializableInk.m
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-07.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SerializableInk.h"
#import "SerializableStroke.h"
#import "MLKit.h"

@implementation SerializableInk

#pragma mark NSCoding

#define kStrokesKey       @"Strokes"
    
+ (BOOL)supportsSecureCoding {
  return YES;
}

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: (SerializableStroke*)super.strokes forKey:kStrokesKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    NSArray<SerializableStroke *> *strokes = [decoder decodeObjectOfClass:SerializableStroke.class forKey: kStrokesKey];
    return [super initWithStrokes:strokes];
}

@end

