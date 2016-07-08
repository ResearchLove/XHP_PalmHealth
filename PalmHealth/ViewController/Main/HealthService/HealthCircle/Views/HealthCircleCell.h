//
//  FriendsCircleCell.h
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsModel.h"
#import "AnswerModel.h"
#import "UIView+WHC_AutoLayout.h"
#import "WHC_StackView.h"

@class AnswerMenuView;


@protocol AnswerMenuViewDelegate <NSObject>

-(void)answerMenuView:(AnswerMenuView *)answerMenuView isClickPraise:(BOOL)isPraise;

@end


@interface AnswerMenuView : WHC_StackView

@property (strong,nonatomic) UIButton *praiseBtn;  //赞
@property (strong,nonatomic) UIButton *commentsBtn;//评论

-(void)clickPraiseButton:(UIButton *)sender;
-(void)clickCommentsButton:(UIButton *)sender;

@property (weak,nonatomic)id <AnswerMenuViewDelegate> delegate;

@end


@class HealthCircleCell;
@protocol FriendsCircleCellDelegate <NSObject>

-(void)friendsCircleCell:(HealthCircleCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel;

-(void)friendsCircleSupperCell:(HealthCircleCell *)cell;

@end

@interface HealthCircleCell : UITableViewCell <AnswerMenuViewDelegate>
@property (nonatomic , strong)UITableView * tableView;
@property (weak,nonatomic) id <FriendsCircleCellDelegate> delegate;

@property (assign,nonatomic) NSInteger row;
@property (strong,nonatomic) FriendsModel *friModel;

@property (strong,nonatomic) UIImageView *userImageView;    //成员头像
@property (strong,nonatomic) UILabel *userNameLabel;        //成员名称
@property (strong,nonatomic) UILabel *contentLabel;         //说说内容
@property (strong,nonatomic) UILabel *timeLabel;            //时间
@property (strong,nonatomic) UIView *praiseView;            //点赞背景视图
@property (strong,nonatomic) WHC_StackView *imageStackView; //说说图片集视图
@property (strong,nonatomic) UIImageView *upArrowImageView; //赞上方的箭头
@property (strong,nonatomic) UIImageView *praiseImageView;  //赞图片（心）
@property (strong,nonatomic) UILabel *praiseUserLabel;      //点赞成员
@property (strong,nonatomic) UIButton *answerBtn;           //回复按钮
@property (strong,nonatomic) WHC_StackView *commentStackView;//回复视图

@property (strong,nonatomic) NSMutableArray *commentLabelAry;
@property (strong,nonatomic) NSMutableArray *imageViewAry;

@property (strong,nonatomic) AnswerMenuView *answerMenuView;

-(void)setFriendsModel:(FriendsModel *)friendsModel;



@end
