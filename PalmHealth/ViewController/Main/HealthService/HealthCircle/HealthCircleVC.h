//
//  FriendsCircleVC.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HealthCircleCell.h"
#import "UIView+WHC_AutoLayout.h"
#import "KeyboradHeaderView.h"
#import "FriendsModel.h"

static  NSString * _Nonnull  kFirendsCircleCellIdentifier = @"FriendCircleCell";
static  NSInteger kDefaultOnePageDataCount = 10;

@interface HealthCircleVC : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,FriendsCircleCellDelegate>

@property (strong,nonatomic) UITableView *_Nonnull friendTableView;
@property (strong,nonatomic) NSMutableArray *_Nonnull friendModelAry;
@property (assign,nonatomic) NSInteger dateModelCount;

@property (strong,nonatomic) WHC_StackView *_Nonnull sendStackView;
@property (strong,nonatomic) UITextView *_Nonnull sendTextView;
@property (strong,nonatomic) KeyboradHeaderView *_Nonnull keyBoradMonitorView;

@property (assign,nonatomic) NSInteger currentAnswerRow;
@property (strong,nonatomic) UIView *_Nonnull lastAnswerLabel;
@property (strong,nonatomic) HealthCircleCell *_Nonnull currentAnswerCell;

@property (strong,nonatomic) UIImageView *_Nonnull downRefreshImageView;
@property (assign,nonatomic) BOOL refreshing;
@property (assign,nonatomic) BOOL canDownRefresh;

@property (nonatomic,strong) UITapGestureRecognizer *_Nonnull gestureRecognizer;



@property (strong,nonatomic) PersonModel *_Nonnull personModel;





@end
