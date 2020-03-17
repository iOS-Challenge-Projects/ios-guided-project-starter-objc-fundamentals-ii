//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "LSITip.h"
#import "LSITipController.h"    // always import .h, never import .m

// Class Extension (private properties / variables)
@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties
@property (nonatomic) LSITipController *tipController;
@property (nonatomic) double subTotal;
@property (nonatomic) int splitCount;
@property (nonatomic) double tipPercentage;
@property (nonatomic) double tip;
@property (nonatomic) NSNumberFormatter *formatter;

// Private IBOutlets
@property (strong, nonatomic) IBOutlet UITextField *totalTextField;
@property (strong, nonatomic) IBOutlet UILabel *splitLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (strong, nonatomic) IBOutlet UIStepper *splitStepper;
@property (strong, nonatomic) IBOutlet UISlider *percentageSlider;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

// Private Methods
- (void)calculateTip;
- (void)updateViews;
- (void)saveTipNamed:(NSString *)name;

@end

@implementation LSITipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tipController = [[LSITipController alloc] init];
    
    // Test Data (take it out later)
    LSITip *tip = [[LSITip alloc] initWithName:@"Coffee and Tea"
                                      subTotal:14.59
                                 tipPercentage:20.0
                                    splitCount:1];
    
    [self.tipController addTip:tip];
    NSLog(@"self.tipController.count: %ld", self.tipController.tips.count);
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated {
//    [self showSaveTipAlert];
}

- (void)calculateTip {
    // TODO: Calculate the tip using the values from the UI
}

- (void)updateViews {
    // TODO: Use the model data to update the views
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview

}

// MARK: - IBActions


// TODO: Connect actions for splitChanged, sliderChanged, and Save Tip button


// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tipController.tips.count;
}

// Lazy Objc property
- (NSNumberFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSNumberFormatter alloc] init];
        _formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    }
    return _formatter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    
    LSITip *tip = self.tipController.tips[indexPath.row];
    cell.textLabel.text = tip.name;
    cell.detailTextLabel.text = [self.formatter stringFromNumber:@(tip.subTotal)]; // number literal (wrapping into NSNumber)
    
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

// TODO: Load the selected tip from the controller

}

// MARK: - Alert Helper

- (void)showSaveTipAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        if (name.length > 0) {
            [self saveTipNamed: name];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
