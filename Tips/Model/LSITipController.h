//
//  LSITipController.h
//  Tips
//
//  Created by Paul Solt on 2/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

// Forward declare a class  (prefer to importing in .h files)
@class LSITip;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

// tips

// NSArray = let, NSMutableArray = var
@property (nonatomic, readonly) NSArray<LSITip *> *tips;

// Methods: createTip, removeTip

- (void)createTipWithName:(NSString *)name
                    total:(double)total
               splitCount:(int)splitCount
            tipPercentage:(double)tipPercentage;

@end

NS_ASSUME_NONNULL_END
