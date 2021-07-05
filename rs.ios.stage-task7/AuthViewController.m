//
//  AuthViewController.m
//  rs.ios.stage-task7
//
//  Created by Ivan on 7/4/21.
//

#import "AuthViewController.h"
#import "UIColor+Color.h"
#import "UIImage+Resize.h"

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
@property (nonatomic) NSString *checkLoginText;
@property (nonatomic) NSString *checkPassText;

//@property (nonatomic) bool isLoginText;
//@property (nonatomic) bool isPassText;

@property (readonly, nonatomic) NSString *constLoginText;
@property (readonly, nonatomic) NSString *constPassText;
@property (readonly, nonatomic) NSString *constSecureText;
@end

@implementation AuthViewController

- (NSString *)constLoginText {
    return @"u";
}
- (NSString *)constPassText {
    return @"p";
}
- (NSString *)constSecureText {
    return @"132";
}
//- (BOOL)isLoginText {
//    return NO;
//}
//- (BOOL)isPassText {
//    return NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self beginingStyles];
    
    self.loginTextField.delegate = self;
    self.passTextField.delegate = self;
}
//MARK: - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"login: %@, pass: %@", self.checkLoginText, self.checkPassText);
    
[textField resignFirstResponder];
    
return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    UITextField *refToTextFieldLoginCheck = self.loginTextField;
    UITextField *refToTextFieldPassCheck = self.passTextField;
    
    NSString *text = [NSString new];
    text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"%@", text);
    if (textField == refToTextFieldLoginCheck) {
        if ( [self.constLoginText isEqualToString:text] ) {
            self.checkLoginText = text;
            NSLog(@"Sucsess");
        }
    }
    
    if (textField == refToTextFieldPassCheck) {
        if ( [self.constPassText isEqualToString:text] ) {
            self.checkPassText = text;
            NSLog(@"Sucsess");
        }
    }
    
    return YES;
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
    [self.autorizeButton setTitle:@"Autorize" forState: UIControlStateNormal];
    self.autorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    //defaults style
    UIImage *person2 = [[UIImage alloc] imageWithImage:[UIImage imageNamed:@"person2"] convertToSize:CGSizeMake(17, 17)];
    [self.autorizeButton setImage:person2 forState:UIControlStateNormal];
    [self.autorizeButton setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.autorizeButton addTarget:self action:@selector(buttonUpAuth) forControlEvents:UIControlEventTouchUpInside];
    [self.autorizeButton addTarget:self action:@selector(checkLoginAndPass) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    UIImage *person = [[UIImage alloc] imageWithImage:[UIImage imageNamed:@"person"] convertToSize:CGSizeMake(17, 17)];
    [self.autorizeButton setImage:person forState:UIControlStateHighlighted];
    [self.autorizeButton addTarget:self action:@selector(buttonHighlightAuth) forControlEvents:UIControlEventTouchDown];
    //disabled
    
    //MARK: - Secure
    self.secureView.layer.borderColor = turquoiseGreen.CGColor;
    self.secureView.layer.borderWidth = 2;
    self.secureView.layer.cornerRadius = 10;
    //[self.secureView setHidden:true];
    
    self.oneButton.layer.borderColor = littleBoyBlue.CGColor;
    self.oneButton.layer.borderWidth = 1.5;
    self.oneButton.layer.cornerRadius = 25;
    self.oneButton.tag = 1;
    //defaults style
    [self.oneButton setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.oneButton addTarget:self action:@selector(buttonSecureUp:) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    [self.oneButton addTarget:self action:@selector(buttonSecureHighlight:) forControlEvents:UIControlEventTouchDown];
    
    self.twoButton.layer.borderColor = littleBoyBlue.CGColor;
    self.twoButton.layer.borderWidth = 1.5;
    self.twoButton.layer.cornerRadius = 25;
    self.twoButton.tag = 2;
    //defaults style
    [self.twoButton setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.twoButton addTarget:self action:@selector(buttonSecureUp:) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    [self.twoButton addTarget:self action:@selector(buttonSecureHighlight:) forControlEvents:UIControlEventTouchDown];
    
    self.threeButton.layer.borderColor = littleBoyBlue.CGColor;
    self.threeButton.layer.borderWidth = 1.5;
    self.threeButton.layer.cornerRadius = 25;
    self.threeButton.tag = 3;
    //defaults style
    [self.threeButton setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [self.threeButton addTarget:self action:@selector(buttonSecureUp:) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    [self.threeButton addTarget:self action:@selector(buttonSecureHighlight:) forControlEvents:UIControlEventTouchDown];
}

//MARK: - Change styles
-(void) changeLoginStyle: (UIColor *) color {
    self.loginTextField.layer.borderColor = color.CGColor;
}
-(void) changePassStyle: (UIColor *) color {
    self.passTextField.layer.borderColor = color.CGColor;
}

-(void) disableLogin {
    [self.loginTextField setEnabled:false];
    [self.autorizeButton setEnabled:false];
    [self.passTextField setEnabled:false];
    [self.loginTextField setAlpha:0.5];
    [self.autorizeButton setAlpha:0.5];
    [self.passTextField setAlpha:0.5];
}
-(void) enableSecure {
    [self.secureView setHidden:false];
}
//MARK: - Actions
-(void) checkLoginAndPass {
    UIColor *turquoiseGreen = [UIColor colorFromHex:0x91c7b1];
    UIColor *vanetianRed = [UIColor colorFromHex:0xc20114];
    
    if ([self.checkLoginText isEqual:self.constLoginText] && [self.checkPassText isEqual:self.constPassText]) {
        NSLog(@"login: %@, pass: %@", self.checkLoginText, self.checkPassText);
    [self changeLoginStyle:turquoiseGreen];
    [self changePassStyle:turquoiseGreen];
        
        //[self disableLogin];
        //[self enableSecure];
        
    }else {
        if ([self.checkLoginText isEqual:self.constLoginText]) {
            [self changeLoginStyle:turquoiseGreen];
            [self changePassStyle:vanetianRed];
            NSLog(@"Bad pass");
        }else {
            if ([self.checkPassText isEqual:self.constPassText]) {
                [self changeLoginStyle:vanetianRed];
                [self changePassStyle:turquoiseGreen];
                NSLog(@"Bad login");
            }else {
                NSLog(@"Bad login and pass");
                [self changeLoginStyle:vanetianRed];
                [self changePassStyle:vanetianRed];
            }
        }
    }
    
}
-(void) buttonHighlightAuth {
    UIColor *littleBoyBlue = [UIColor colorFromHex:0x80a4ed];
    [self.autorizeButton setBackgroundColor:[littleBoyBlue colorWithAlphaComponent:0.2]];
}
-(void) buttonUpAuth {
    UIColor *white = [UIColor whiteColor];
    [self.autorizeButton setBackgroundColor:white];
}

-(void) buttonSecureHighlight: (UIButton *)sender {
    UIColor *littleBoyBlue = [UIColor colorFromHex:0x80a4ed];
    [sender setBackgroundColor:[littleBoyBlue colorWithAlphaComponent:0.2]];
    
    NSMutableString * newLabel = [NSMutableString stringWithString:self.secureLabel.text];
    if ([newLabel containsString:@"-"]) {
        newLabel = [NSMutableString stringWithString:@""];
    }
    
    NSLog(@"%ld", sender.tag);
    //if (self.secureLabel.text.length < 3) {
        switch (sender.tag) {
            case 1:
                [newLabel appendString:@"1"];
                NSLog(@"%lu", sender.tag);
                NSLog(@"%@", newLabel);
                self.secureLabel.text = newLabel;
                break;
            case 2:
                [newLabel appendString:@"2"];
                NSLog(@"%lu", sender.tag);
                self.secureLabel.text = newLabel;
                break;
            case 3:
                [newLabel appendString:@"3"];
                NSLog(@"%lu", sender.tag);
                self.secureLabel.text = newLabel;
                break;
            default:
                NSLog(@"Error SecureLabel");
                break;
        }
   // }else{
//        self.secureLabel.text = @"-";
//        NSLog(@"Else: %@", newLabel);
    //}
    
    NSLog(@"Finish:%@", newLabel);
}
-(void) buttonSecureUp: (UIButton *)sender  {
    UIColor *white = [UIColor whiteColor];
    [sender setBackgroundColor:white];
    
    if([self.secureLabel.text isEqualToString:self.constSecureText]) {
        NSLog(@"SUCSEC");
    }
    
    if (self.secureLabel.text.length < 3) {
    }else{
        self.secureLabel.text = @"-";
        //NSLog(@"Else: %@", newLabel);
    }
    
    NSLog(@"Tap");
}

@end
