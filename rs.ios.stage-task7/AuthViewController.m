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

@property (readonly, nonatomic) NSString *constLoginText;
@property (readonly, nonatomic) NSString *constPassText;
@property (readonly, nonatomic) NSString *constSecureText;

@property (readonly, nonatomic) unsigned long littleBoyBlue;
@property (readonly, nonatomic) unsigned long blackCoral;
@property (readonly, nonatomic) unsigned long turquoiseGreen;
@property (readonly, nonatomic) unsigned long vanetianRed;
@end

@implementation AuthViewController
- (unsigned long)littleBoyBlue {
    return 0x80a4ed;
}
- (unsigned long)blackCoral {
    return 0x4c5c68;
}
-(unsigned long)turquoiseGreen {
    return 0x91c7b1;
}
- (unsigned long)vanetianRed {
    return 0xc20114;
}

- (NSString *)constLoginText {
    return @"username";
}
- (NSString *)constPassText {
    return @"password";
}
- (NSString *)constSecureText {
    return @"132";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self keyboardSetting];
    [self beginingStyles];
    
    self.loginTextField.delegate = self;
    self.passTextField.delegate = self;
}
//MARK: - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"login: %@, pass: %@", self.checkLoginText, self.checkPassText);
    
    UITextField *refToTextFieldPassCheck = self.passTextField;
    
    if (textField == refToTextFieldPassCheck) {
        
        [textField resignFirstResponder];
    }
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
        }else {
            self.checkLoginText = nil;
        }
    }
    
    if (textField == refToTextFieldPassCheck) {
        if ( [self.constPassText isEqualToString:text] ) {
            
            self.checkPassText = text;
            NSLog(@"Sucsess");
        }else {
            self.checkPassText = nil;
        }
    }
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    UITextField *refToTextFieldLoginCheck = self.loginTextField;
    UITextField *refToTextFieldPassCheck = self.passTextField;
    
    if (textField == refToTextFieldLoginCheck) {
        
        NSLog(@"Begin change Login");
        if (![textField.text isEqualToString:self.constLoginText]) {
            
            textField.text = nil;
        }
    }
    if (textField == refToTextFieldPassCheck) {
        
        NSLog(@"Begin change pass");
        if (![textField.text isEqualToString:self.constPassText]) {
            
            textField.text = nil;
        }
    }
    return YES;
}

//MARK: - Styles
-(void) beginingStyles {
    
    self.loginTextField.layer.borderColor = [UIColor colorFromHex:self.blackCoral].CGColor;
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5;
    self.loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.loginTextField.text = nil;
    [self.loginTextField setAlpha:1];
    
    
    self.passTextField.layer.borderColor = [UIColor colorFromHex:self.blackCoral].CGColor;
    self.passTextField.layer.borderWidth = 1.5;
    self.passTextField.layer.cornerRadius = 5;
    self.passTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passTextField.text = nil;
    [self.passTextField setAlpha:1];
    
    self.autorizeButton.layer.borderColor = [UIColor colorFromHex:self.littleBoyBlue].CGColor;
    self.autorizeButton.layer.borderWidth = 2;
    self.autorizeButton.layer.cornerRadius = 10;
    [self.autorizeButton setTitle:@"Autorize" forState: UIControlStateNormal];
    self.autorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    [self.autorizeButton setAlpha:1];
    //defaults style
    UIImage *person2 = [[UIImage alloc] imageWithImage:[UIImage imageNamed:@"person2"] convertToSize:CGSizeMake(17, 17)];
    [self.autorizeButton setImage:person2 forState:UIControlStateNormal];
    [self.autorizeButton setTitleColor:[UIColor colorFromHex:self.littleBoyBlue] forState:UIControlStateNormal];
    [self.autorizeButton addTarget:self action:@selector(buttonUpAuth) forControlEvents:UIControlEventTouchUpInside];
    [self.autorizeButton addTarget:self action:@selector(checkLoginAndPass) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    UIImage *person = [[UIImage alloc] imageWithImage:[UIImage imageNamed:@"person"] convertToSize:CGSizeMake(17, 17)];
    [self.autorizeButton setImage:person forState:UIControlStateHighlighted];
    [self.autorizeButton addTarget:self action:@selector(buttonHighlightAuth) forControlEvents:UIControlEventTouchDown];
    
    //MARK: - Secure styles
    self.secureView.layer.borderColor = UIColor.whiteColor.CGColor;
    self.secureView.layer.borderWidth = 2;
    self.secureView.layer.cornerRadius = 10;
    [self.secureView setHidden:true];
    
    self.oneButton.layer.borderColor = [UIColor colorFromHex:self.littleBoyBlue].CGColor;
    self.oneButton.layer.borderWidth = 1.5;
    self.oneButton.layer.cornerRadius = 25;
    self.oneButton.tag = 1;
    //defaults style
    [self.oneButton setTitleColor:[UIColor colorFromHex:self.littleBoyBlue] forState:UIControlStateNormal];
    [self.oneButton addTarget:self action:@selector(buttonSecureUp:) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    [self.oneButton addTarget:self action:@selector(buttonSecureHighlight:) forControlEvents:UIControlEventTouchDown];
    
    self.twoButton.layer.borderColor = [UIColor colorFromHex:self.littleBoyBlue].CGColor;
    self.twoButton.layer.borderWidth = 1.5;
    self.twoButton.layer.cornerRadius = 25;
    self.twoButton.tag = 2;
    //defaults style
    [self.twoButton setTitleColor:[UIColor colorFromHex:self.littleBoyBlue] forState:UIControlStateNormal];
    [self.twoButton addTarget:self action:@selector(buttonSecureUp:) forControlEvents:UIControlEventTouchUpInside];
    //highlighted style
    [self.twoButton addTarget:self action:@selector(buttonSecureHighlight:) forControlEvents:UIControlEventTouchDown];
    
    self.threeButton.layer.borderColor = [UIColor colorFromHex:self.littleBoyBlue].CGColor;
    self.threeButton.layer.borderWidth = 1.5;
    self.threeButton.layer.cornerRadius = 25;
    self.threeButton.tag = 3;
    //defaults style
    [self.threeButton setTitleColor:[UIColor colorFromHex:self.littleBoyBlue] forState:UIControlStateNormal];
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
-(void) enableLogin {
    [self.loginTextField setEnabled:true];
    [self.autorizeButton setEnabled:true];
    [self.passTextField setEnabled:true];
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
    if ([self.checkLoginText isEqual:self.constLoginText] && [self.checkPassText isEqual:self.constPassText]) {
        
        NSLog(@"login: %@, pass: %@", self.checkLoginText, self.checkPassText);
        
        [self changeLoginStyle:[UIColor colorFromHex:self.turquoiseGreen]];
        [self changePassStyle:[UIColor colorFromHex:self.turquoiseGreen]];
        
        [self disableLogin];
        [self enableSecure];
        
    }else {
        if ([self.checkLoginText isEqual:self.constLoginText]) {
            
            [self changeLoginStyle:[UIColor colorFromHex:self.turquoiseGreen]];
            [self changePassStyle:[UIColor colorFromHex:self.vanetianRed]];
            NSLog(@"Bad pass");
        }else {
            if ([self.checkPassText isEqual:self.constPassText]) {
                
                [self changeLoginStyle:[UIColor colorFromHex:self.vanetianRed]];
                [self changePassStyle:[UIColor colorFromHex:self.turquoiseGreen]];
                NSLog(@"Bad login");
            }else {
                NSLog(@"Bad login and pass");
                [self changeLoginStyle:[UIColor colorFromHex:self.vanetianRed]];
                [self changePassStyle:[UIColor colorFromHex:self.vanetianRed]];
            }
        }
    }
}
-(void) buttonHighlightAuth {
    [self.autorizeButton setBackgroundColor:[[UIColor colorFromHex:self.littleBoyBlue] colorWithAlphaComponent:0.2]];
}
-(void) buttonUpAuth {
    UIColor *white = [UIColor whiteColor];
    [self.autorizeButton setBackgroundColor:white];
}

-(void) buttonSecureHighlight: (UIButton *)sender {
    [sender setBackgroundColor:[[UIColor colorFromHex:self.littleBoyBlue] colorWithAlphaComponent:0.2]];
    self.secureView.layer.borderColor = UIColor.whiteColor.CGColor;
    
    NSMutableString * newLabel = [NSMutableString stringWithString:self.secureLabel.text];
    if ([newLabel containsString:@"_"]) {
        newLabel = [NSMutableString stringWithString:@""];
    }
    
    if (self.secureLabel.text.length < 3) {
        
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
    }else{
        self.secureLabel.text = @"_";
    }
}
-(void) buttonSecureUp: (UIButton *)sender  {
    UIColor *white = [UIColor whiteColor];
    [sender setBackgroundColor:white];
    
    if ([self.secureLabel.text isEqualToString:self.constSecureText]) {
        
        NSLog(@"SUCSEC");
        
        self.secureView.layer.borderColor = [UIColor colorFromHex:self.turquoiseGreen].CGColor;
        [self showAlert];
    }else {
        if (self.secureLabel.text.length == 3) {
            
            self.secureLabel.text = @"_";
            self.secureView.layer.borderColor = [UIColor colorFromHex:self.vanetianRed].CGColor;
        }
    }
}
//MARK: - Alert
-(void) showAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                   message:@"You are successfuly authorized!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Refresh"
                                                          style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        [self beginingStyles];
        [self enableLogin];
        self.checkLoginText = nil;
        self.checkPassText = nil;
        self.secureLabel.text = @"_";
    }];
    
    [alert addAction:firstAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}
//MARK: - Seeting keyboard
-(void) keyboardSetting {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)dismissKeyboard
{
    [self.loginTextField resignFirstResponder];
    [self.passTextField resignFirstResponder];
}
@end
