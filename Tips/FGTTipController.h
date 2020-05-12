//
//  FGTTipController.h
//  Tips
//
//  Created by FGT MAC on 5/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

//Forward class declaration (Build time is faster)
@class FGTTip;

NS_ASSUME_NONNULL_BEGIN

@interface FGTTipController : NSObject

@property NSArray<FGTTip *> *tip;

@end

NS_ASSUME_NONNULL_END
