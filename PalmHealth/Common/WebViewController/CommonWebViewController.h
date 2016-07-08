//
//  CommonWebViewController.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/25.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface CommonWebViewController : UIViewController

//是否使用网页标题作为nav标题、默认YES
@property (assign,nonatomic) BOOL useMPageTitleAsNavTitle;

//是否显示加载进度、默认Yes
@property (assign,nonatomic) BOOL showLoadingProgress;

//是否禁止历史记录、默认No
@property (assign,nonatomic) BOOL disableBackButton;

@property (strong,nonatomic) NSString *url;

@end
