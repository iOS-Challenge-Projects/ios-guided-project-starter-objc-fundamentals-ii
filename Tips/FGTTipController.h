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


//Public propertties
@property (nonatomic, readonly) NSArray<FGTTip *> *tip;


//Public methods
- (void)addTip:(NSSet *)objects;



@end

NS_ASSUME_NONNULL_END
