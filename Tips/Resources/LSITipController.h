//
//  LSITipController.h
//  Tips
//
//  Created by Paul Solt on 4/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward class declaration (this classes details will be shared later, but I want to use a placeholder for now)
// Helps with build times being faster
// Helps with classes that need to include each other (import cycle)
@class LSITip;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

// Public Properties

@property (nonatomic, readonly) NSArray<LSITip *> *tips;

// Public Methods

- (void)addTip:(LSITip *)tip;

@end

NS_ASSUME_NONNULL_END
