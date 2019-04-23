//
//  HikVideo.h
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
#import "PlayView.h"
#import "Mcu_sdk/PlayBackManager.h"
#import "Mcu_sdk/RealPlayManager.h"



@interface HikVideo :WXComponent<PlayBackManagerDelegate,RealPlayManagerDelegate>
@property (nonatomic, retain) PlayBackManager   *backManager;
@property (nonatomic, retain) RealPlayManager   *realManager;

@end

