//
//  LSITipCell.m
//  Tips
//
//  Created by Paul Solt on 3/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipCell.h"
#import "LSITip.h"

@interface LSITipCell ()

@property (nonatomic) IBOutlet UILabel *totalLabel;
@property (nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) NSNumberFormatter *formatter;

@end

@implementation LSITipCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setTip:(LSITip *)tip {
    _tip = tip;
    [self updateViews];
}

- (NSNumberFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    }
    return _formatter;
}

- (void)updateViews {
    if (!self.tip) {
        return;
    }
    double tip = self.tip.total * self.tip.tipPercentage / 100.0;
    double totalWithTip = self.tip.total + tip;
    self.totalLabel.text = [self.formatter stringFromNumber:@(totalWithTip)];
    self.tipLabel.text = [self.formatter stringFromNumber:@(tip)];
    self.titleLabel.text = self.tip.name;
}

@end
