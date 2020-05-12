//
//  FGTTip.h
//  Tips
//
//  Created by FGT MAC on 5/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGTTip : NSObject

@property (readonly, nonatomic) double total;
//When we create a property
// 1-Setter implicitly create
//- (void)setTotal:(double)total;
// 2-Getter method is created
//- (double)total;
// 3-Create an instance variable
// double _total;

//When we set it as readonly then a setter wont be created
@property (readonly, nonatomic) int splitCount;
@property (readonly, nonatomic) double tipPercentage;
@property (readonly, copy, nonatomic) NSString *name;


- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
