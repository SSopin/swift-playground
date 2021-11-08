//
//  SerializableInk.h
//  Minutes
//
//  Created by Sergii Sopin on 2021-11-07.
//  Copyright © 2021 Myzir Inc. All rights reserved.
//

#ifndef SerializableInk_h
#define SerializableInk_h

#import "MLKit.h"

@interface SerializableInk: MLKInk <NSSecureCoding>

- (void) encodeWithCoder:(NSCoder *)encoder;
- (id)   initWithCoder:(NSCoder *)decoder;
+ (BOOL) supportsSecureCoding;

@end

#endif /* SerializableInk_h */
