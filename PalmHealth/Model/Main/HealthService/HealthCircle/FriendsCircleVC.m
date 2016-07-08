//
//  FriendsCircleVC.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "FriendsCircleVC.h"
#import "NavigationBar.h"
#import "AnswerModel.h"
#import "FriendsCircleHeaderView.h"
#import "FriendsCircleFooterView.h"

@interface FriendsCircleVC ()

@end

@implementation FriendsCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"朋友圈"];
    
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    
    _friendModelAry = [NSMutableArray array];
    _dateModelCount = kDefaultOnePageDataCount;
    [self initData];
    [self initLayout];
    // Do any additional setup after loading the view.
}
/**
 *  初始化布局
 */
-(void)initLayout
{
    _friendTableView = [UITableView new];
    [self.view addSubview:_friendTableView];
    
    [_friendTableView whc_FrameAuto:WHCAutoRectMake(0, 0, 0, 0)];
    _friendTableView.delegate = self;
    _friendTableView.dataSource = self;
    [_friendTableView registerClass:[FriendsCircleCell class] forCellReuseIdentifier:kFirendsCircleCellIdentifier];
    _friendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    FriendsCircleHeaderView *headerView = [[FriendsCircleHeaderView alloc]initWithFrame:CGRectMake(0, 0, 0, 300)];
    headerView.personModel = _personModel;
    _friendTableView.tableHeaderView = headerView;
    
    FriendsCircleFooterView *footerView = [[FriendsCircleFooterView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    footerView.titleStr = @"正在加载更多...";
    _friendTableView.tableFooterView = footerView;
 
    [self.view addSubview:self.downRefreshImageView];
    [_downRefreshImageView whc_Frame:WHCRectMake(30, 34, 30, 30)];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view addSubview:self.sendView];
        
         [_sendStackView addSubview:self.sendTextView];
        _sendStackView.whc_Orientation = Vertical;
        _sendStackView.whc_Edge = UIEdgeInsetsMake(5, 5, 5, 5);
        [_sendStackView whc_LeadingSpace:0];
        [_sendStackView whc_RightSpace:0];
        [_sendStackView whc_BaseLineSpace:-40];
        [_sendStackView whc_Height:40];
        
        [_sendStackView whc_StartLayout];
        
        _keyBoradMonitorView = (KeyboradHeaderView *)[KeyboradHeaderView monitorKeyboradShowAddHeaderView:_sendStackView observer:self];
        
    });
    
    [self.view addGestureRecognizer:self.gestureRecognizer];
}

/**
 *  Getter and Setter
 *
 *  @return
 */
-(WHC_StackView *)sendView
{
    if (_sendStackView == nil) {
        _sendStackView = [[WHC_StackView alloc]init];
        _sendStackView.backgroundColor = [UIColor whiteColor];
        
    }
    return _sendStackView;
}

-(UITextView *)sendTextView
{
    if (_sendTextView == nil) {
        _sendTextView = [[UITextView alloc]init];
        _sendTextView.delegate = self;
        _sendTextView.layer.cornerRadius = 4;
        _sendTextView.font = [UIFont systemFontOfSize:15.0f];
        _sendTextView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        _sendTextView.returnKeyType = UIReturnKeySend;
    }
    return _sendTextView;
}

-(UIImageView *)downRefreshImageView
{
    if (_downRefreshImageView == nil) {
        _downRefreshImageView = [[UIImageView alloc]init];
        _downRefreshImageView.image = [UIImage imageNamed:@"albumReflashIcon"];
    }
    return _downRefreshImageView;
}


#pragma mark - Getter
-(UITapGestureRecognizer *)gestureRecognizer
{
    if (_gestureRecognizer == nil) {
        _gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapView)];
    }
    return _gestureRecognizer;
}


/**
 *  初始化数据源
 */
-(void)initData
{
    
    
    _personModel = [[PersonModel alloc]init];
    _personModel.backImage = @"personBack.jpg";
    _personModel.personName = @"黄晓明";
    _personModel.personIcon = @"me.jpg";
    
    for(int i = 0; i < _dateModelCount; i++){
     
        FriendsModel *friModel = [FriendsModel new];
        friModel.answerAry = [NSMutableArray array];
        friModel.userImage = @"me.jpg";
        friModel.userName = @"黄晓明";
        if (i % 2 == 0) {
            friModel.content = @"1998年出演个人首部电视剧《爱情不是游戏》，从而进入演艺圈[1]  。2001年因主演古装剧《大汉天子》而获得关注[2]  。2005年起连续10年入选“福布斯中国名人榜”[3]  。2006年主演武侠剧《神雕侠侣》[4]  。2007年凭借民国剧《新上海滩》获得第13届上海电视节白玉兰奖最佳男演员提名";
            friModel.isHidePraiseView = YES;
        }else{
            friModel.content = @"2011年成立个人演艺公司黄晓明工作室；除了投资影视剧外，还投资红酒、医院、高尔夫球场等等[19]  。2015年成立上海醇雅明坊公司";
            friModel.isHidePraiseView = NO;
        }
        //NSInteger imageCount = 5;
        NSInteger imageCount = arc4random_uniform(6);
        NSMutableArray *imageAry = [NSMutableArray array];
        for (int j = 0; j < imageCount; j ++) {
            [imageAry addObject:[NSString stringWithFormat:@"pic%d.jpg",j]];
            AnswerModel *ansModel = [AnswerModel new];
            if (j % 2) {
                ansModel.name = [NSString stringWithFormat:@"孙丽%d",j];
                ansModel.content = @"黄晓明和Angelababy在上海正式举行婚礼的日子";
            }else{
                ansModel.name = [NSString stringWithFormat:@"邓超%d",j];
                ansModel.content = @"由于已经很久没有一线明星的婚礼了，加上本次婚礼前期宣传和各种筹备都非常盛大";
            }
            ansModel.isReply = j % 2;
            [friModel.answerAry addObject:ansModel];
        }
        friModel.imageAry = imageAry;
        [_friendModelAry addObject:friModel];
    }
}

/**
 *  UITableViewDataSource methods
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _friendModelAry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsModel *friendModel = [_friendModelAry objectAtIndex:indexPath.row];
    
    FriendsCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirendsCircleCellIdentifier];
    cell = [[FriendsCircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFirendsCircleCellIdentifier];
    cell.delegate = self;
    cell.row = indexPath.row;
    [cell setFriendsModel:friendModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/**
 *  UITableViewDelegate methods
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    return [UITableViewCell whc_CellHeightForIndexPath:indexPath tableView:tableView];

}



/**
 * FriendsCircleCellDelegate  点赞回调
 *
 *  @param cell
 */
-(void)friendsCircleSupperCell:(FriendsCircleCell *)cell
{
    [_friendTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
}

/**
 *  FriendsCircleCellDelegate  在进行评论的时候编辑框自动定位到该评论
 *
 *  @param cell
 *  @param row
 *  @param commentLabel
 */
-(void)friendsCircleCell:(FriendsCircleCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel
{
    [_sendStackView whc_Height:40];
    [_sendTextView becomeFirstResponder];
    
    _currentAnswerCell = cell;
    _currentAnswerRow = row;
    _lastAnswerLabel = commentLabel;
    CGRect answerRect = [commentLabel convertRect:commentLabel.bounds toView:self.view];
    CGRect senRcct = _sendStackView.frame;
    CGFloat diffY = CGRectGetMaxY(answerRect) - CGRectGetMinY(senRcct);
    [_friendTableView setContentOffset:CGPointMake(0, _friendTableView.contentOffset.y + diffY) animated:YES];

}

/**
 *  UITextViewDelegate
 *
 *  @param textView
 *  @param range
 *  @param text
 *
 *  @return
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [_sendTextView resignFirstResponder];
        FriendsModel *friModel = _friendModelAry[_currentAnswerRow];
        AnswerModel * ansModel = [AnswerModel new];
        ansModel.name = @"肖海平";
        ansModel.isReply = NO;
        ansModel.content = _sendTextView.text;
        [friModel.answerAry addObject:ansModel];
        [_friendTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_currentAnswerRow inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        _sendTextView.text = nil;
        return NO;
    }else {
        CGFloat contentHeight = [self stringHeight:_sendTextView.text constrainedWidth:CGRectGetWidth(_sendTextView.frame) font:_sendTextView.font];
        CGFloat deffix = contentHeight - CGRectGetHeight(_sendTextView.frame) + 20;
        if (contentHeight < 30) {
            contentHeight = 30;
            deffix = 0;
        }else {
            contentHeight += 10;
        }
        [_sendStackView whc_Height:contentHeight + 10];
    }
    return YES;
}

- (CGFloat)stringHeight:(NSString *)content constrainedWidth:(CGFloat)width font:(UIFont *)font{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    CGSize contentSize = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
#pragma clang diagnostic pop
    return contentSize.height;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsety = -scrollView.contentOffset.y;
    
    /// 处理下拉刷新
    if (!_refreshing) {
        _downRefreshImageView.transform = CGAffineTransformMakeRotation(offsety / 50 * 2 * M_PI);
        [_downRefreshImageView whc_TopSpace:34 + offsety];
    }
    if (offsety > 50 && !_refreshing) {
        _canDownRefresh = YES;
        [_downRefreshImageView whc_TopSpace:34 + 50];
        _refreshing = YES;
        _downRefreshImageView.transform = CGAffineTransformIdentity;
        @autoreleasepool {
            CABasicAnimation * rotateAnimation = [CABasicAnimation new];
            rotateAnimation.keyPath = @"transform.rotation.z";
            rotateAnimation.fromValue = @0;
            rotateAnimation.toValue = @(M_PI * 2);
            rotateAnimation.duration = 1.0;
            rotateAnimation.repeatCount = INFINITY;
            [_downRefreshImageView.layer addAnimation:rotateAnimation forKey:@"_rotateAnimation"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _refreshing = NO;
                _canDownRefresh = NO;
                [_downRefreshImageView.layer removeAllAnimations];
                [_downRefreshImageView whc_TopSpace:34];
                [_downRefreshImageView updateConstraintsIfNeeded];
                [UIView animateWithDuration:0.3 animations:^{
                    [_downRefreshImageView layoutIfNeeded];
                }completion:^(BOOL finished) {
                    [_friendModelAry removeAllObjects];
                    _dateModelCount = kDefaultOnePageDataCount;
                    [self initData];
                    [_friendTableView reloadData];
                }];
            });
        }
    }
    /// 处理上拉刷新
    if (offsety < 0 && offsety < -(scrollView.contentSize.height - CGRectGetHeight(_friendTableView.frame))) {
        if (!_refreshing) {
            _refreshing = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                _refreshing = NO;
                _dateModelCount += kDefaultOnePageDataCount;
                [self initData];
                [_friendTableView reloadData];
            });
        }
    }
}

/**
 *  Event Response
 */
-(void)didTapView
{
     [_sendTextView resignFirstResponder];
    
    
}

-(void)backEvent:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _friendTableView.contentInset = UIEdgeInsetsZero;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
