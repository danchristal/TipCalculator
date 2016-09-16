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
@property (weak, nonatomic) IBOutlet UILabel *tipDisplayLabel;

@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountDisplayLabel;


- (void)calculateTip;
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
        
}

- (IBAction)calculateTip{
    
    NSNumber *billAmount;
    NSNumber *tipResult;
    
    NSNumberFormatter *totalFormatter = [[NSNumberFormatter alloc] init];
    totalFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    totalFormatter.alwaysShowsDecimalSeparator = NO;
    totalFormatter.usesSignificantDigits = YES;
    totalFormatter.maximumSignificantDigits = 3;
    totalFormatter.minimumSignificantDigits = 1;
    
    billAmount = [totalFormatter numberFromString:self.billAmountTextField.text];
    
    tipResult = @([billAmount integerValue] * self.tipSlider.value);
    
    self.tipDisplayLabel.text = [@"$" stringByAppendingString:[totalFormatter stringFromNumber:tipResult]];
    
    NSNumberFormatter *tipFormatter = [[NSNumberFormatter alloc] init];
    tipFormatter.numberStyle = NSNumberFormatterPercentStyle;
    
    self.tipAmountDisplayLabel.text = [tipFormatter stringFromNumber: [NSNumber numberWithFloat:self.tipSlider.value]];
    
}

@end
