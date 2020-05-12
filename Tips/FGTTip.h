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

@property double total;
@property int splitCount;
@property double tipPercentage;
@property NSString *name;


- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
