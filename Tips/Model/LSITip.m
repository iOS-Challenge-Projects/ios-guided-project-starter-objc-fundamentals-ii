//
//  LSITip.m
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITip.h"

@implementation LSITip

- (instancetype)initWithName:(NSString *)name
                    subTotal:(double)subTotal
               tipPercentage:(double)tipPercentage
                  splitCount:(int)splitCount {
    self = [super init]; // NSObject init
    if (self) { // self != nil
        // Init Rule: Always set your instance variables (_name), don't use property syntax, because it can have side effects (self.name)
    
        _name = name;
        _subTotal = subTotal;
        _tipPercentage = tipPercentage;
        _splitCount = splitCount;
    }
    return self;
}

@end
