//
//  LSITip.h
//  Tips
//
//  Created by Paul Solt on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// ARC = Automatic Reference Counting (Swift + Objc)
// MRC = Manual Reference Counting

@interface LSITip : NSObject

// public properties

// Property Attributes: * = default
// readonly, *readwrite
// *atomic vs. nonatomic (use nonatomic for all properties)
// copy = Always use with NSString
// strong*, weak
// retain (MRC)

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) double total;
@property (nonatomic, readonly) int splitCount;
@property (nonatomic, readonly) double tipPercentage;

// Swift
//init(name: String, total: Double)

- (instancetype)initWithName:(NSString *)name
                       total:(double)total
                  splitCount:(int)splitCount
               tipPercentage:(double)tipPercentage;

@end

NS_ASSUME_NONNULL_END
