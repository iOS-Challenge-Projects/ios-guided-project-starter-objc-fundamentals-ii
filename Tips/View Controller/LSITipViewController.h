//
//  LSITipViewController.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

//Forward class declaration
@class FGTTipController;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipViewController : UIViewController

//Public Properties

//Dependecy injection allow us to pass in the 
@property (nonatomic) FGTTipController *tipController;

//Public Methods



@end

NS_ASSUME_NONNULL_END
