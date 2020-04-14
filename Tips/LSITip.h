//
//  LSITip.h
//  Tips
//
//  Created by Paul Solt on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITip : NSObject

// What information do we need to store?

// property attribute (* = default)

// readonly
// readwrite*

// copy
// assign* (default for primitive types)

// atomic*
// nonatomic

@property (readonly, nonatomic) double total;
// 1. setter method is created by compiler
// - (void)setTotal:(double)total;

// 2. getter method is created by compiler
// - (double)total;

// 3. create an instance variable (_total)
// double _total;

@property (readonly, nonatomic) int splitCount;
@property (readonly, nonatomic) double tipPercentage;

// Always use copy with NSString, NSArray, NSSet
@property (readonly, nonatomic, copy) NSString *name;

- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
