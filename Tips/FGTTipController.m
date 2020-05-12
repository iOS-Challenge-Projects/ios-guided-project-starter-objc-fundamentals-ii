//
//  FGTTipController.m
//  Tips
//
//  Created by FGT MAC on 5/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "FGTTipController.h"
#import "FGTTip.h"

//Class extension
@interface FGTTipController ()

//All properties default to nil, 0 or NO

//Private properties
@property (nonatomic) NSMutableArray<FGTTip *> *internalTips;

//Private Methdos


@end

@implementation FGTTipController

- (instancetype)init {
    self = [super init];
    if(self){
        _internalTips = [[NSMutableArray alloc] init];
        
        //Test data
//        FGTTip *tip = [[FGTTip alloc] initWithTotal:84.45 splitCount:2 tipPercentage:20 name:@"Brick oven pizza"];
        //[self addTip:tip];
    }
    return self;
};

//Computed property for the tips property
- (NSArray<FGTTip *> *)tips {
    //Always use the "_" instance version name in the getter/setter methods
    //By using [_xx copy] we create a unmutable copy
    return [_internalTips copy];
};

- (void)addTip:(FGTTip *)tip {
    //Use dot syntax anytime you are not in a init/dealloc/setter/getter
    [self.internalTips addObject: tip];
    
    //Same as above
    //[[self internalTips] addObject:tip];
}

@end
