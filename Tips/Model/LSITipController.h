//
//  LSITipController.h
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

// .h header file (PUBLIC)

#import <Foundation/Foundation.h>

// class forward declaration
@class LSITip;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

// Immutable (read only!)
@property (readonly, nonatomic) NSArray<LSITip *> *tips;

// Property attributes
// readonly, readwrite*
// atomic*, nonatomic

// Use default init from NSObject (don't need to redeclare it)
//- (instancetype)init;

- (void)addTip:(LSITip *)tip;

@end

NS_ASSUME_NONNULL_END
