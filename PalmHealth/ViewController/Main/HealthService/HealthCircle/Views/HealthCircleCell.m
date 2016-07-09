//
//  FriendsCircleCell.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/13.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "HealthCircleCell.h"
#import "PalmHealth-swift.h"


@implementation AnswerMenuView

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.whc_Edge = UIEdgeInsetsZero;
        self.whc_Orientation = Horizontal;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.praiseBtn];
        [self addSubview:self.commentsBtn];
        [self whc_StartLayout];
    }
    return self;
}


/**
 *  Getter and Setter
 *
 *  @return
 */
-(UIButton *)praiseBtn
{
    if (_praiseBtn == nil) {
        _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_praiseBtn setTitle:@"赞" forState:UIControlStateNormal];
        [_praiseBtn addTarget:self action:@selector(clickPraiseButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _praiseBtn;
}

-(UIButton *)commentsBtn
{
    if (_commentsBtn == nil) {
        _commentsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentsBtn setTitle:@"评论" forState:UIControlStateNormal];
        [_commentsBtn addTarget:self action:@selector(clickCommentsButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentsBtn;
}

/**
 *  点击赞事件
 *
 *  @param sender
 */
-(void)clickPraiseButton:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        _praiseBtn.transform = CGAffineTransformMakeScale(2,2);
    }completion:^(BOOL finished) {
        _praiseBtn.transform = CGAffineTransformIdentity;
        if (_delegate && [_delegate respondsToSelector:@selector(answerMenuView:isClickPraise:)]) {
            [_delegate answerMenuView:self isClickPraise:YES];
        }
    }];
}

/**
 *  点击评论事件
 *
 *  @param sender
 */
-(void)clickCommentsButton:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(answerMenuView:isClickPraise:)]) {
        [_delegate answerMenuView:self isClickPraise:NO];
    }
}
@end

@implementation HealthCircleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect cellFrame = self.contentView.frame;
        cellFrame.size.width = [UIScreen mainScreen].bounds.size.width;
        self.contentView.frame = cellFrame;
        
        _commentLabelAry = [NSMutableArray array];
        _imageViewAry = [NSMutableArray array];
        
        [self.contentView addSubview:self.userImageView];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.imageStackView];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.answerBtn];
        [self.contentView addSubview:self.upArrowImageView];
        [self.contentView addSubview:self.praiseView];
        [_praiseView addSubview:self.praiseImageView];
        [_praiseView addSubview:self.praiseUserLabel];
        [self.contentView addSubview:self.commentStackView];
        
        [self initLayout];
        
    }
    return self;
}


/**
 *  初始化布局
 */
- (void)initLayout
{
    [_userImageView whc_Frame:WHCRectMake(10,15,40,40)];
    
    [_userNameLabel whc_TopSpaceEqualView:_userImageView];  //顶部_userImageView对齐
    [_userNameLabel whc_LeftSpace:10 toView:_userImageView];
    [_userNameLabel whc_widthAuto];
    [_userNameLabel whc_Height:20];
    
    [_contentLabel whc_LeftSpaceEqualView:_userNameLabel];
    [_contentLabel whc_TopSpace:5 toView:_userNameLabel];
    [_contentLabel whc_RightSpace:10];
    [_contentLabel whc_HeightAuto];
    
    [_imageStackView whc_TopSpace:5 toView:_contentLabel];
    [_imageStackView whc_LeftSpaceEqualView:_contentLabel];
    [_imageStackView whc_RightSpace:10];
    [_imageStackView whc_AutoHeight];
    
    //配置说说图片展示容器
    _imageStackView.whc_Column = 3;                 //最大3列
    _imageStackView.whc_Edge = UIEdgeInsetsZero;    //内边距为0
    _imageStackView.whc_Space = 4;                  //图片之间的空隙为4
    _imageStackView.whc_Orientation = All;          //横竖混合布局
    _imageStackView.whc_HeightWidthRatio = 4 / 3;   //图片高度比
    
    [_timeLabel whc_TopSpace:10 toView:_imageStackView];
    [_timeLabel whc_LeftSpaceEqualView:_imageStackView];
    [_timeLabel whc_Size:CGSizeMake(100, 20)];
    
    [_answerBtn whc_TopSpaceEqualView:_timeLabel];
    [_answerBtn whc_TrailingSpace:10];
    [_answerBtn whc_Size:CGSizeMake(30, 25)];
    
    [_upArrowImageView whc_TopSpace:5 toView:_timeLabel];
    [_upArrowImageView whc_LeftSpaceEqualView:_timeLabel];
    [_upArrowImageView whc_Size:CGSizeMake(60, 20)];
    
    [_praiseView whc_BottomLine:1 lineColor:[UIColor colorWithWhite:0.8 alpha:1]];
    [_praiseView whc_TopSpace:10 toView:_timeLabel];
    [_praiseView whc_LeftSpaceEqualView:_timeLabel];
    [_praiseView whc_RightSpace:10];
    [_praiseView whc_Height:21];
    
    [_praiseImageView whc_LeftSpace:5];
    [_praiseImageView whc_CenterY:0];
    [_praiseImageView whc_Size:CGSizeMake(15, 15)];
    
    
    [_praiseUserLabel whc_LeftSpace:5 toView:_praiseImageView];
    [_praiseUserLabel whc_TopSpace:0];
    [_praiseUserLabel whc_RightSpace:0];
    [_praiseUserLabel whc_BottomSpace:0];
    
    
    [_commentStackView whc_TopSpace:0 toView:_praiseView];
    [_commentStackView whc_LeftSpaceEqualView:_timeLabel];
    [_commentStackView whc_RightSpace:10];
    [_commentStackView whc_AutoHeight];
    
    //配置评论展示容器
    _commentStackView.whc_Edge = UIEdgeInsetsMake(5, 5, 5, 5);//内边距为5
    _commentStackView.whc_Space = 10;
    _commentStackView.whc_Orientation = Vertical;//垂直布局
    
    //设置cell底部间隙
    self.whc_CellBottomView = _commentStackView;
    self.whc_CellBottomOffset = 10;
    [self whc_BottomLine:1 lineColor:[UIColor colorWithWhite:0.8 alpha:1]];
}

/**
 *  Getter and Setter
 *
 *  @return
 */
-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
    }
    return _userImageView;
    
}

-(UILabel *)userNameLabel
{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.textColor = [UIColor colorWithRed:37.0 / 255 green:75.0 / 255 blue:131.0 / 255 alpha:1];
    }
    return _userNameLabel;
}

-(UILabel *)contentLabel
{
    if(_contentLabel == nil){
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.backgroundColor = [UIColor whiteColor];
    }
    return _contentLabel;
}

-(UILabel *)praiseUserLabel
{
    if(_praiseUserLabel == nil){
        _praiseUserLabel = [[UILabel alloc]init];
        _praiseUserLabel.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1.0];
        _praiseUserLabel.font = [UIFont systemFontOfSize:14];
    }
    return _praiseUserLabel;
}

-(UILabel *)timeLabel
{
    if(_timeLabel == nil){
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor grayColor];
    }
    return _timeLabel;
}

-(UIButton *)answerBtn
{
    if (_answerBtn == nil) {
        _answerBtn = [[UIButton alloc]init];
        [_answerBtn addTarget:self action:@selector(clickAnswerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _answerBtn;
}

-(UIView *)praiseView
{
    if (_praiseView == nil) {
        _praiseView = [[UIView alloc]init];
        _praiseView.backgroundColor =  [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1.0];
    }
    return _praiseView;
}

-(UIImageView *)praiseImageView
{
    if (_praiseImageView == nil) {
        _praiseImageView = [[UIImageView alloc]init];
    }
    return _praiseImageView;
}

-(UIImageView *)upArrowImageView
{
    if (_upArrowImageView == nil) {
        _upArrowImageView = [[UIImageView alloc]init];
    }
    return _upArrowImageView;
}

-(WHC_StackView *)imageStackView
{
    if (_imageStackView == nil) {
        _imageStackView = [[WHC_StackView alloc]init];
     }
    return _imageStackView;
}

-(WHC_StackView *)commentStackView
{
    if (_commentStackView == nil) {
        _commentStackView = [[WHC_StackView alloc]init];
        _commentStackView.backgroundColor = [UIColor colorWithRed:240.0 / 255 green:240.0 / 255 blue:240.0 / 255 alpha:1.0];
    }
    return _commentStackView;
}


-(AnswerMenuView *)answerMenuView
{
    if (_answerMenuView == nil) {
        _answerMenuView = [[AnswerMenuView alloc]init];
        _answerMenuView.delegate = self;
    }
    return _answerMenuView;

}

/**
 *  添加数据
 *
 *  @param friendsModel 
 */
-(void)setFriendsModel:(FriendsModel *)friendsModel
{
    if (!_friModel) {
        if (![_friModel.userImage isEqualToString:friendsModel.userImage]) {
            _userImageView.image = [UIImage imageNamed:friendsModel.userImage];
        }
    }
    
   _userNameLabel.text = friendsModel.userName;
   _contentLabel.text = friendsModel.content;
   
    if (friendsModel.imageAry.count == 1) {
        _imageStackView.whc_Column = 2;
    }else{
        _imageStackView.whc_Column = 3;
    }
    [self setImageViewWithTalkShow:friendsModel];
    
    
    _timeLabel.text = @"1小时前";
    [_answerBtn setBackgroundImage:[UIImage imageNamed:@"albumOperateMore"] forState:UIControlStateNormal];
    
    _upArrowImageView.image = [UIImage imageNamed:@"likeCmtBg"];
     friendsModel.answerAry.count == 0 ? [_upArrowImageView setHidden:YES ]: [_upArrowImageView setHidden:NO ];
    
    _praiseImageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
    _praiseUserLabel.text = @"肖海平";
    
    if (friendsModel.isHidePraiseView) {
        _praiseView.hidden = YES;
        [_commentStackView whc_TopSpace:10 toView:_timeLabel];
    }else{
        _praiseView.hidden = NO;
        [_commentStackView whc_TopSpace:0 toView:_praiseView];
    }
    
    [self resetViewWithComment:friendsModel];
    
    _friModel = nil;
    _friModel = friendsModel;
}

/**
 *  设置说说图片展示
 *
 *  @param friendModel
 */
-(void)setImageViewWithTalkShow:(FriendsModel *)friendModel
{
    NSInteger oldCount = _imageStackView.whc_SubViewCount;
    NSInteger countDiff = friendModel.imageAry.count;
    for (NSInteger i = 0; i < oldCount; i++) {
        UIImageView *imageView = _imageStackView.subviews[i];
        if (_friModel.imageAry.count > i && [_friModel.imageAry[i] isEqualToString:friendModel.imageAry[i]]) {
            
        }else{
            imageView.image = [UIImage imageNamed:friendModel.imageAry[i]];
        }
    }
    
    for (NSInteger i = 0; i < countDiff; i++) {
        BOOL isNew = NO;
        UIImageView *imageView = (_imageViewAry.count > oldCount + i ? _imageViewAry[oldCount + i] : nil);
        if (imageView == nil) {
            isNew = YES;
            imageView = [UIImageView new];
            imageView.userInteractionEnabled = YES;
        }
        imageView.tag = oldCount + i;
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageGestureRecognizer:)];
        [imageView addGestureRecognizer:tapGestureRecognizer];
        imageView.image = [UIImage imageNamed:friendModel.imageAry[i + oldCount]];
        if (isNew) {
            [_imageViewAry addObject:imageView];
        }
        [_imageStackView addSubview:imageView];
        
    }
    [_imageStackView whc_StartLayout];
}


/**
 *  重置评论视图
 *
 *  @param friendModel
 */
-(void)resetViewWithComment:(FriendsModel *)friendModel
{
    NSInteger oldCount = _commentStackView.whc_SubViewCount ;
    NSInteger countDiff = friendModel.answerAry.count - oldCount;
    if (countDiff < 0) {
        NSArray *subViewAry = _commentStackView.subviews;
        NSArray *removeCommentViewAry = [subViewAry subarrayWithRange:NSMakeRange(oldCount + countDiff, -countDiff)];
        for (UIView *view in removeCommentViewAry) {
            [view removeFromSuperview];
        }
        oldCount =  _commentStackView.whc_SubViewCount;
    }
    countDiff = MAX(0, countDiff);
    for (NSInteger i = 0; i < oldCount; i++) {
        AnswerModel *answerModel = friendModel.answerAry[i];
        UILabel *commentLabel = _commentStackView.subviews[i];
        [self setComment:commentLabel answer:answerModel userName:friendModel.userName];
    }
    
    for (NSInteger i = 0; i < countDiff; i++) {
        BOOL isNew = NO;
        UILabel *commentLabel = (_commentLabelAry.count > oldCount + i ? _commentLabelAry[oldCount + i] : nil);
        if (commentLabel == nil) {
            isNew = YES;
            commentLabel = [UILabel new];
            commentLabel.backgroundColor = _commentStackView.backgroundColor;
            commentLabel.numberOfLines = 0;
            commentLabel.font = [UIFont systemFontOfSize:14];
        }
        
        AnswerModel *answerModel = friendModel.answerAry[oldCount + i];
        [self setComment:commentLabel answer:answerModel userName:friendModel.userName];
        if (isNew) {
            [_commentLabelAry addObject:commentLabel];
        }
        [_commentStackView addSubview:commentLabel];
    }
    [_commentStackView whc_StartLayout];
}

/**
 *  评论文本格式
 *
 *  @param label
 *  @param answerModel
 *  @param userName    被回复人
 */
-(void)setComment:(UILabel *)label answer:(AnswerModel *)answerModel userName:(NSString *)userName
{
    NSString *text = nil;
    if (answerModel.isReply) {
        text = [NSString stringWithFormat:@"%@回复%@: %@",answerModel.name,userName,answerModel.content];
    }else{
        text = [NSString stringWithFormat:@"%@: %@",answerModel.name,answerModel.content];
    }
    label.text = text;
    NSMutableAttributedString *textAttrStr = [[NSMutableAttributedString alloc]initWithString:text];
    if (answerModel.isReply) {
        [textAttrStr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:answerModel.name]];
        [textAttrStr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:userName]];
    }else{
        [textAttrStr addAttribute:NSForegroundColorAttributeName value:_userNameLabel.textColor range:[text rangeOfString:answerModel.name]];
    }
    label.attributedText = textAttrStr;
}

/**
 *  单击图片说说手势事件
 *
 *  @param tapGestureRecognizer
 */
-(void)tapImageGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSInteger column = 3;
    if (_friModel.imageAry.count == 1) {
        column = 2;
    }
    [ImageDisplayView show:_friModel.imageAry index:tapGestureRecognizer.view.tag item:tapGestureRecognizer.view column:column];
}


/**
 *  点击回复按钮事件
 */
-(void)clickAnswerButton:(UIButton *)sender
{
    [self.answerMenuView whc_Width:0];
    [self.contentView addSubview:_answerMenuView];
    [_answerMenuView whc_TrailingSpace:2 toView:_answerBtn];
    [_answerMenuView whc_CenterY:0 toView:_answerBtn];
    [_answerMenuView layoutIfNeeded];
    [_answerMenuView whc_Size:CGSizeMake(150, 40)];
    [UIView animateWithDuration:0.3 animations:^{
        [_answerMenuView layoutIfNeeded];
        [_answerMenuView whc_StartLayout];
    }completion:^(BOOL finished) {
        
    }];
    NSLog(@"you Click AnswerButton...");
}

/**
 *  AnswerMenuViewDelegate methods
 *
 *  @param answerMenuView
 *  @param isPraise       是否是赞
 */
-(void)answerMenuView:(AnswerMenuView *)answerMenuView isClickPraise:(BOOL)isPraise
{
    [answerMenuView removeFromSuperview];
    if (isPraise) {
        _friModel.isHidePraiseView = !_friModel.isHidePraiseView;
        if (_delegate && [_delegate respondsToSelector:@selector(friendsCircleSupperCell:)]) {
            [_delegate friendsCircleSupperCell:self];
        }
    }else{
        if (_delegate && [_delegate respondsToSelector:@selector(friendsCircleCell:clickRow:lastCommentLabel:)]) {
            UIView *answerLabel = [_commentStackView.subviews lastObject];
            if (_commentStackView.subviews.count == 0) {
                answerLabel = _commentStackView;
            }
            [_delegate friendsCircleCell:self clickRow:_row lastCommentLabel:answerLabel];
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
