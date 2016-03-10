//
//  YZLMessageVerifiedTool.h
//  YZL_MessageVerification_Demo
//
//  Created by YZL on 16/3/4.
//  Copyright © 2016年 YZL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SMS_SDK/SMSSDK.h>
@interface YZLMessageVerifiedTool : NSObject
//获取短信验证码方式的枚举值
typedef enum YZLGetCodeMethod{
    YZLGetCodeMethodSMS = 0,  //文本短信方式
    YZLGetCodeMethodVoice = 1 //语音方式
} YZLGetCodeMethod;

/**
 *  @brief 验证码获取回调
 *  @param error 当error为空时表示成功
 */
typedef void (^YZLGetCodeResultHandler) (NSError *error);

/**
 * @from  v1.1.1
 * @brief 验证码验证回调
 * @param error 当error为空时表示成功
 */
typedef void (^YZLCommitCodeResultHandler) (NSError *error);

/** 在appDelegate中使用appkey和appsecret初始化应用 */
+ (void)registerAppkey:(NSString *)appKey withappSecret:(NSString *)appSecret;

/** 发送短信验证码 */
/**
 *  @from                    v1.1.1
 *  @brief                   获取验证码(Get verification code)
 *  @param method            获取验证码的方法(The method of getting verificationCode)
 *  @param phoneNumber       电话号码(The phone number)
 *  @param zone              区域号，不要加"+"号(Area code),如86（中国）
 *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
 *  @param result            请求结果回调(Results of the request)
 */
+ (void)getVerificationCodeByMethod:(YZLGetCodeMethod)method
                       phoneNumber:(NSString *)phoneNumber
                              zone:(NSString *)zone
                  customIdentifier:(NSString *)customIdentifier
                            result:(YZLGetCodeResultHandler)result;

/**
 * @from               v1.1.1
 * @brief              提交验证码(Commit the verification code)
 *
 * @param code         验证码(Verification code)
 * @param phoneNumber  电话号码(The phone number)
 * @param zone         区域号，不要加"+"号(Area code),如86（中国）
 * @param result       请求结果回调(Results of the request)
 */
+ (void)commitVerificationCode:(NSString *)code
                   phoneNumber:(NSString *)phoneNumber
                          zone:(NSString *)zone
                        result:(YZLCommitCodeResultHandler)result;

@end
