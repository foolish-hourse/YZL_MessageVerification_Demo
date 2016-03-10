//
//  YZLMessageVerifiedTool.m
//  YZL_MessageVerification_Demo
//
//  Created by YZL on 16/3/4.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import "YZLMessageVerifiedTool.h"

@implementation YZLMessageVerifiedTool
/** 在appDelegate中使用appkey和appsecret初始化应用 */
+ (void)registerAppkey:(NSString *)appKey withappSecret:(NSString *)appSecret{
// 请注意：测试短信条数限制发送数量：20条/天，APP开发完成后请到Mob官网(http://mob.com/ )后台提交审核，获得不限制条数的免费短信权限。
    [SMSSDK registerApp:appKey withSecret:appSecret];
}

/** 获取短信验证码*/
+ (void)getVerificationCodeByMethod:(YZLGetCodeMethod)method
                        phoneNumber:(NSString *)phoneNumber
                               zone:(NSString *)zone
                   customIdentifier:(NSString *)customIdentifier
                             result:(YZLGetCodeResultHandler)result {
    SMSGetCodeMethod getCodeMethod = 0;
    if (method == 0) {
        getCodeMethod = 0;
    }else if (method == 1){
        getCodeMethod = 1;
    }
    [SMSSDK getVerificationCodeByMethod:getCodeMethod phoneNumber:phoneNumber zone:zone customIdentifier:customIdentifier result:result];
}

/** 验证短信验证码 */
+ (void)commitVerificationCode:(NSString *)code
                  phoneNumber:(NSString *)phoneNumber
                         zone:(NSString *)zone
                        result:(SMSCommitCodeResultHandler)result {
    [SMSSDK commitVerificationCode:code phoneNumber:phoneNumber zone:zone result:result];
}
@end
