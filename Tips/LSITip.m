//
//  LSITip.m
//  Tips
//
//  Created by Paul Solt on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITip.h"

@implementation LSITip

// If you override both setter/getter or disable them, you need to tell the compiler to still create your
// backing instance variable
@synthesize name = _name;

- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name {
    self = [super init];
    if (self) {
        
        // init or dealloc (deinit) we want to use the
        // _underscoreVariableName for assignment
        // This prevents side effects from property didSet/willSet
        _total = total;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
        _name = name;
    }
    return self;
}

- (NSString *)name {
    NSLog(@"accessing name");
    return _name;
}


@end
