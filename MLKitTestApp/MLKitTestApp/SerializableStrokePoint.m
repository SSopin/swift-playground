//
//  SerializableStrokePoint
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-06.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializableStrokePoint.h"

@implementation SerializableStrokePoint

#pragma mark NSCoding

#define kXKey       @"X"
#define kYKey       @"Y"
#define kTKey       @"T"
    
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeFloat: super.x forKey:kXKey];
    [encoder encodeFloat:  super.y forKey:kYKey];
    [encoder encodeObject:  super.t forKey:kTKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    float x = [decoder decodeFloatForKey: kXKey];
    float y = [decoder decodeFloatForKey:  kYKey];
    long  t = [decoder decodeInt64ForKey:  kTKey];
    return [super initWithX:x y:y t:t];
}

@end
