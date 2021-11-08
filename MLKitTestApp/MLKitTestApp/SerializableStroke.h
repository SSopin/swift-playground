//
//  SerializableStroke.h
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-06.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#ifndef SerializableStroke_h
#define SerializableStroke_h

#import "MLKit.h"
#import "SerializableStrokePoint.h"

@interface SerializableStroke: MLKStroke <NSSecureCoding>

// TODO: Try without it first
-(NSArray<SerializableStrokePoint *> *) serilizablePoints;

- (void) encodeWithCoder:(NSCoder *)encoder;
- (id)   initWithCoder:(NSCoder *)decoder;
+ (BOOL) supportsSecureCoding;

@end

#endif /* SerializableStroke_h */
