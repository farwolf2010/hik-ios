//
//  HikVideo.m
//  AFNetworking
//
//  Created by 郑江荣 on 2019/4/5.
//

#import "HikVideo.h"
#import "farwolf.h"
#import <WeexPluginLoader/WeexPluginLoader.h>



WX_PlUGIN_EXPORT_COMPONENT(hikvideo, HikVideo)


@implementation HikVideo
WX_EXPORT_METHOD(@selector(start:callback:))
WX_EXPORT_METHOD(@selector(stop))
-(PlayView*)loadView{
 
    PlayView *v=[PlayView new];
    _backManager = [[PlayBackManager alloc]init];
//    _realManager= [[RealPlayManager alloc]init];
     _realManager = [[RealPlayManager alloc] initWithDelegate:self];
    _backManager.delegate = self;
    return v;
    
}

-(void)start:(NSString*)_id callback:(WXModuleCallback)callback{
    PlayView *player=self.view;
 
     VP_STREAM_TYPE g_currentQuality = STREAM_MAG;
    [_realManager stopRealPlay];
    [_realManager startRealPlay:_id videoType:STREAM_SUB playView:player.playView complete:^(BOOL finish,NSString *message) {
        //finish返回YES时,代表当前操作成功.finish返回NO时,message会返回预览过程中的失败信息
        if (finish) {

            callback(@{@"err":@(0)});
        }else {
            callback(@{@"err":@(-1)});
        }
    }];
}

-(void)stop{
    
}

- (void)realPlayCallBack:(PLAY_STATE)playState realManager:(RealPlayManager *)realPlayManager{
    
}

@end
