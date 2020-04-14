//
//  LSITipCell.h
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSITip; // forward declaration

NS_ASSUME_NONNULL_BEGIN

@interface LSITipCell : UITableViewCell

@property (nonatomic) LSITip *tip;

@end

NS_ASSUME_NONNULL_END
