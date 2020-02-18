//
//  LSITipController.m
//  Tips
//
//  Created by Paul Solt on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

// Generally you forward declare classes in header files
// you import in implementation files

// Class Extension
@interface LSITipController ()

// Private property
@property (nonatomic) NSMutableArray<LSITip *> *internalTips;

// Private methods

@end

@implementation LSITipController

// init
- (instancetype)init {
    self = [super init];
    if (self) {
        
        // Swift
        //self.tips = [Tip]()
        
        // 1. alloc = buying the land (1 acre)
        // 2. init = building the house
        _internalTips = [[NSMutableArray alloc] init];
    }
    return self;
}

// override a property getter for tips (computed property)
- (NSArray<LSITip *> *)tips {
    // Returning a constant array prevents the caller from
    // modifying our internal storage (which would break
    // encapsulation)
    return [self.internalTips copy]; // copy on write
}

- (void)createTipWithName:(NSString *)name
                    total:(double)total
               splitCount:(int)splitCount
            tipPercentage:(double)tipPercentage {
    
    LSITip *tip = [[LSITip alloc] initWithName:name
                                         total:total
                                    splitCount:splitCount
                                 tipPercentage:tipPercentage];
    
    [self.internalTips addObject:tip];
}

@end
