//
//  LSITipViewController.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward Class Declaration
@class LSITipController;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipViewController : UIViewController

// Public Property

// Dependency injection allows us to pass in the model controller
@property (nonatomic) LSITipController *tipController;

// Public IBOutlet (Similar to UITableViewCell's imageView)

@end

NS_ASSUME_NONNULL_END
