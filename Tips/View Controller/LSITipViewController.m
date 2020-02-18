//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "LSITipController.h"
#import "LSITip.h"

// Class Extension

@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties
@property (nonatomic) double total;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double tip;
@property (nonatomic) LSITipController *tipController;

// Private IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UITextField *totalTextField;
@property (strong, nonatomic) IBOutlet UILabel *splitLabel;
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
    
    self.tipController = [[LSITipController alloc] init]; // FIXME: move to initWithNibName / coder
    
    // Finished pressing return key
    [self.totalTextField addTarget:self action:@selector(calculateTip) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

// When should I call calculateTip?

- (void)calculateTip {
    // Get data from the UI
    self.percentage = round(self.percentageSlider.value);
    self.total = [self.totalTextField.text doubleValue]; // NSNumberFormatter ($)
    self.split = self.splitStepper.value;

    // calculate a tip with splits

    double tipAmount = self.total * (self.percentage / 100.0);  // $4
    self.tip = tipAmount / self.split;  // 2 people, $2
    NSLog(@"tip: %0.2f", self.tip);

    [self updateViews];
}

- (void)updateViews {
    // Use the model data to update the views
    self.percentageSlider.value = self.percentage;
    
    
    self.splitLabel.text = [NSString stringWithFormat:@"%d", self.split];
    // %0.0f = no decimals for a floating point number (round)
    
    // QUESTION: how would I fix the text "popping" as I move the slider: MONOSpaced font
    self.percentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage]; // %% = %
    
    // FIXME: Update to use NSNumberFormatter with currencyType
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", self.tip];
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview

    [self.tipController createTipWithName:name
                                    total:self.total
                               splitCount:self.split
                            tipPercentage:self.percentage];
    
    // How to get UI to update table?
    [self.tableView reloadData]; // FIXME: add just the rows that changed
}

// MARK: - IBActions
- (IBAction)updateSplit:(UIStepper *)sender {
    NSLog(@"split: %f", self.splitStepper.value);
    
    [self calculateTip];
}

- (IBAction)updatePercentage:(UISlider *)sender {
    NSLog(@"slider: %f", self.percentageSlider.value);
    
    [self calculateTip];
}

- (IBAction)saveTip:(UIButton *)sender {
    NSLog(@"save tip!");
    
    [self showSaveTipAlert];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tipController.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    
    LSITip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
    cell.textLabel.text = tip.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", tip.total];
    
    return cell;
}

// MARK: - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
// TODO: Load the selected tip from the controller
//
//}

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
