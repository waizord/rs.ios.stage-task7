//
//  AuthViewController.m
//  rs.ios.stage-task7
//
//  Created by Ivan on 7/4/21.
//

#import "AuthViewController.h"
#import "UIColor+Color.h"

@interface AuthViewController ()
@property (weak, nonatomic) IBOutlet UILabel *RSLabel;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UIButton *autorizeButton;
@property (weak, nonatomic) IBOutlet UIView *secureView;
@property (weak, nonatomic) IBOutlet UILabel *secureLabel;
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;

@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self beginingStyles];
}

//MARK: - Styles
-(void) beginingStyles {
    UIColor *blackCoral = [UIColor colorFromHex:0x4c5c68];
    UIColor *turquoiseGreen = [UIColor colorFromHex:0x91c7b1];
    UIColor *vanetianRed = [UIColor colorFromHex:0xc20114];
    UIColor *littleBoyBlue = [UIColor colorFromHex:0x80a4ed];
    
    self.loginTextField.layer.borderColor = blackCoral.CGColor;
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5;
    self.loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.passTextField.layer.borderColor = blackCoral.CGColor;
    self.passTextField.layer.borderWidth = 1.5;
    self.passTextField.layer.cornerRadius = 5;
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.autorizeButton.layer.borderColor = littleBoyBlue.CGColor;
    self.autorizeButton.layer.borderWidth = 2;
    self.autorizeButton.layer.cornerRadius = 10;
    
    self.secureView.layer.borderColor = turquoiseGreen.CGColor;
    self.secureView.layer.borderWidth = 2;
    self.secureView.layer.cornerRadius = 10;
    
    self.oneButton.layer.borderColor = littleBoyBlue.CGColor;
    self.oneButton.layer.borderWidth = 1.5;
    self.oneButton.layer.cornerRadius = 25;
    self.twoButton.layer.borderColor = littleBoyBlue.CGColor;
    self.twoButton.layer.borderWidth = 1.5;
    self.twoButton.layer.cornerRadius = 25;
    self.threeButton.layer.borderColor = littleBoyBlue.CGColor;
    self.threeButton.layer.borderWidth = 1.5;
    self.threeButton.layer.cornerRadius = 25;
}
@end
