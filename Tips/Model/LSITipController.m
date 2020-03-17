//
//  LSITipController.m
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

// .m Implementation file (PRIVATE)

// Class Extension (Private properties, instance variables, methods)
@interface LSITipController () {
    // Private instance variables
    int _counter; // private variable (defaults to 0)
}

// Private property
@property NSMutableArray<LSITip *> *internalTips;

// Private methods

@end


@implementation LSITipController

// Init

- (instancetype)init {
    self = [super init];
    if (self) {
        // by default all variables are set to either nil, 0, false
        
        // Calling a method on an object that is nil, does nothing
        // no-op: no operation
        
        // How do I initialize my internalTips?
        
        _internalTips = [[NSMutableArray alloc] init];
//        _internalTips = [NSMutableArray new]; // only works with 0 parameters
    }
    return self;
}

- (void)addTip:(LSITip *)tip {
    [self.internalTips addObject:tip];
}

// Computed property from Swift
// Overriding a default property

- (NSArray<LSITip *> *)tips {
    return [self.internalTips copy]; // NSMutableArray -> NSArray
}

// Implement your private methods without declaring them


@end
