//
//  ViewController.m
//  TipCalculator
//
//  Created by Dan Christal on 2016-09-16.
//  Copyright © 2016 Dan Christal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipDisplayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapRecieved:(UITapGestureRecognizer *)sender {
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentageTextField resignFirstResponder];
    
}

- (IBAction)calculateTip:(UIButton *)sender {
    
    
    NSNumber *tipPercent;
    NSNumber *billAmount;
    NSNumber *tipResult;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.alwaysShowsDecimalSeparator = NO;
    numberFormatter.usesSignificantDigits = YES;
    numberFormatter.maximumSignificantDigits = 3;
    numberFormatter.minimumSignificantDigits = 1;
    
    
    
    tipPercent = [numberFormatter numberFromString:self.tipPercentageTextField.text];
    billAmount = [numberFormatter numberFromString:self.billAmountTextField.text];
    
    tipResult = @([billAmount integerValue] * ([tipPercent integerValue]*0.01));
    
    self.tipDisplayLabel.text = [@"$" stringByAppendingString:[numberFormatter stringFromNumber:tipResult]];
    
    
}

@end
