//
//  LSITipController.m
//  Tips
//
//  Created by Paul Solt on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

// Class Extension (Private properties, instance variables, methods)

@interface LSITipController ()

// All properties and variables will default to nil, 0, or NO

// Private Properties
@property (nonatomic) NSMutableArray<LSITip *> *internalTips;

// Private methods

@end


@implementation LSITipController

- (instancetype)init {
    self = [super init];
    if (self) {
        _internalTips = [[NSMutableArray alloc] init];
        
        // TEST DATA (Remove later)
        LSITip *tip = [[LSITip alloc] initWithTotal:84.45 splitCount:2 tipPercentage:20 name:@"Brick oven pizza"];
        [self addTip:tip];
    }
    return self;
}

// Create a computed property for the tips property, so that no
// one modifies the collection without using our addTip/removeTip methods

- (NSArray<LSITip *> *)tips {
    // always use _instanceVariableName in your setter/getter property
    // methods to prevent an infinite loop
    return [_internalTips copy];        // Copy on Write (COW)
}

- (void)addTip:(LSITip *)tip {
    // Use the dot syntax anytime you're not in a init/dealloc/setter/getter
    [self.internalTips addObject:tip];
    
    // Alternate Syntax: method calling syntax
    // [[self internalTips] addObject:tip];
}

@end
