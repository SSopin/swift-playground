//
//  SerializableStrokePoint.h
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-06.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#ifndef SerializableStrokePoint_h
#define SerializableStrokePoint_h

#import "MLKit.h"

// Modify @interface line to include the NSCoding protocol
@interface SerializableStrokePoint: MLKStrokePoint <NSCoding>

- (void) encodeWithCoder:(NSCoder *)encoder;
- (id)   initWithCoder:(NSCoder *)decoder;

@end
#endif /* SerializableStrokePoint_h */
