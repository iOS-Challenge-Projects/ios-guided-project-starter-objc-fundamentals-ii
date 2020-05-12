//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
//Import the h file to gain access to props and methods
#import "FGTTip.h"
#import "FGTTipController.h"
//Conform to delegate protocols in the .m file UITableViewDelegate
@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties

@property (nonatomic) double total;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double tip;

// Private IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
@property (strong, nonatomic) IBOutlet UILabel *splitLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (strong, nonatomic) IBOutlet UIStepper *splitStepper;
@property (strong, nonatomic) IBOutlet UISlider *precentageSlider;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

// Private Methods

@end

@implementation LSITipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //FGTTip *tip = [[FGTTip alloc] initWithTotal:84.45 splitCount:2 tipPercentage:20 name:@"Brick oven pizza"];
    
    
    //NSLog(@"Tip: %@",tip.name);
    
    //Renamed property not posible because is readonly
    //tip.name = @"Tacos";
    
    //NSLog(@"Tip: %0.2f", tip.tipPercentage);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

// Lazy Property
- (FGTTipController *)tipController {
    //Swift: if(_tipController != nil)
    if (!_tipController) {
        //Initialize
        _tipController = [[FGTTipController alloc] init];
    }
    //Else return it
    return _tipController;
}

- (void)calculateTip {
    // TODO: Calculate the tip using the values from the UI
    self.percentage = round(self.precentageSlider.value);
    self.total = [self.totalTextField.text doubleValue];
    self.split = self.splitStepper.value;
    
    self.tip = self.total * (self.percentage / 100.0) / self.split;
    
    //NSLog(@"Tip: %f", self.tip);
    
    [self updateViews];
}

- (void)updateViews {
    // TODO: Use the model data to update the views
    self.splitStepper.value = self.split;
    self.precentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f", self.total];
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2F", self.tip];
    self.splitLabel.text = [NSString stringWithFormat:@"%d", self.split];
    //%% = % for output
    self.percentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage];
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview
    //1.Create new object to add it to array
    FGTTip *tip = [[FGTTip alloc] initWithTotal:self.total splitCount:self.split tipPercentage:self.percentage name: name];
    
    //2.Add tip to array
    [self.tipController addTip:tip];
    
    [self.tableView reloadData];
}

// MARK: - IBActions
- (IBAction)SplitValueChanged:(id)sender {
    //set value
    self.split = round(self.splitStepper.value);
    //invoke method
    [self calculateTip];
}

- (IBAction)sliderChanged:(id)sender {
    self.percentage = round(self.precentageSlider.value);
    [self calculateTip];
}

- (IBAction)savedButtonPressed:(id)sender {
    //invoke method
    [self showSaveTipAlert];
}




// TODO: Connect actions for splitChanged, sliderChanged, and Save Tip button


// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tipController.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tipCell" forIndexPath:indexPath];
    
    FGTTip *tip = self.tipController.tips[indexPath.row];
    
    cell.textLabel.text = tip.name;
    
    return cell;
    
}

// MARK: - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

// TODO: Load the selected tip from the controller

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
