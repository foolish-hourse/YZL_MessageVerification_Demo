//
//  ViewController.m
//  YZL_MessageVerification_Demo
//
//  Created by YZL on 16/3/4.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "ViewController.h"
#import "YZLMessageVerifiedTool.h"

@interface ViewController () <UITextFieldDelegate>
//输入手机号的文本框
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
//输入验证码的文本框
@property (weak, nonatomic) IBOutlet UITextField *verifiedCodeTextField;
//语音验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
//短信验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *smsButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设定textField里只能输入数字
    self.verifiedCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneNumTextField.keyboardType = UIKeyboardTypeNumberPad;
    //初始化时设置语音验证码和短信验证码两个按钮不可用
    self.voiceButton.enabled = NO;
    self.smsButton.enabled = NO;
    //判断输入的手机号码是否是11位
    [self.phoneNumTextField addTarget:self action:@selector(phoneNumberCountJudge) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - SEL
- (void)phoneNumberCountJudge {
    if (self.phoneNumTextField.text.length != 11) {
        self.voiceButton.enabled = NO;
        self.smsButton.enabled = NO;
    }else {
        self.voiceButton.enabled = YES;
        self.smsButton.enabled = YES;
    }
}
//发送语音验证码
- (IBAction)sendVoiceVerified:(id)sender {
    [YZLMessageVerifiedTool getVerificationCodeByMethod:YZLGetCodeMethodVoice phoneNumber:self.phoneNumTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"发送语音验证码成功");
        }else {
            NSLog(@"发送语音验证码失败,%@",error);
        }
    }];
}

//发送短信验证码
- (IBAction)sendSMSVerified:(id)sender {
    [YZLMessageVerifiedTool getVerificationCodeByMethod:YZLGetCodeMethodSMS phoneNumber:self.phoneNumTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"发送短信验证码成功");
        }else {
            NSLog(@"发送短信验证码失败,%@",error);
        }
    }];
}

//判断验证码是否正确按钮
- (IBAction)judgeYesOrNo:(id)sender {
    [YZLMessageVerifiedTool commitVerificationCode:self.verifiedCodeTextField.text phoneNumber:self.phoneNumTextField.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
        }else {
            NSLog(@"验证失败,%@",error);
        }
    }];
}

@end
