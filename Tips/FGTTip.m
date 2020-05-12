//
//  FGTTip.m
//  Tips
//
//  Created by FGT MAC on 5/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "FGTTip.h"

@implementation FGTTip

- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name {
    
    self = [super init];
    
    if(self) {
         
        _total = total;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
        _name = name;
    }
    return self;
    
};

@end
