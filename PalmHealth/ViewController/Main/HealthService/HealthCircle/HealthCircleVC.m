//
//  FriendsCircleVC.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/12.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "HealthCircleVC.h"
#import "NavigationBar.h"
#import "AnswerModel.h"
#import "HealthCircleHeaderView.h"
#import "HealthCircleFooterView.h"

@interface HealthCircleVC ()

@end

@implementation HealthCircleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"健康圈"];
    
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
    [_friendTableView registerClass:[HealthCircleCell class] forCellReuseIdentifier:kFirendsCircleCellIdentifier];
    _friendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    HealthCircleHeaderView *headerView = [[HealthCircleHeaderView alloc]initWithFrame:CGRectMake(0, 0, 0, 300)];
    headerView.personModel = _personModel;
    _friendTableView.tableHeaderView = headerView;
    
    HealthCircleFooterView *footerView = [[HealthCircleFooterView alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
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
    _personModel.personName = @"彭林";
    _personModel.personIcon = @"me.jpg";
    
    for(int i = 0; i < _dateModelCount; i++){
     
        FriendsModel *friModel = [FriendsModel new];
        friModel.answerAry = [NSMutableArray array];
        friModel.userImage = @"me.jpg";
        friModel.userName = @"彭林";
        if (i % 2 == 0) {
            friModel.content = @"南京甲状腺病医学研究院是南京市一家治疗甲状腺疾病综合实力较高的医院，座落于南京市秦淮区光华路海福巷1号，自开诊以来不断发展及完善，检诊设备日益更新，就诊环境整体改善";
            friModel.isHidePraiseView = YES;
        }else{
            friModel.content = @"甲状腺结节是指在甲状腺内的肿块，可随吞咽动作随甲状腺而上下移动，是临床常见的病症，可由多种病因引起。临床上有多种甲状腺疾病，如甲状腺退行性变、炎症、自身免疫以及新生物等都可以表现为结节。甲状腺结节可以单发，也可以多发，多发结节比单发结节的发病率高，但单发结节甲状腺癌的发生率较高。";
            friModel.isHidePraiseView = NO;
        }
        //NSInteger imageCount = 5;
        NSInteger imageCount = arc4random_uniform(6);
        NSMutableArray *imageAry = [NSMutableArray array];
        for (int j = 0; j < imageCount; j ++) {
            [imageAry addObject:[NSString stringWithFormat:@"pic%d.jpg",j]];
            AnswerModel *ansModel = [AnswerModel new];
            if (j % 2) {
                ansModel.name = [NSString stringWithFormat:@"黄侃%d",j];
                ansModel.content = @"希腊研究人员发现甘菊茶可减少甲状腺良性和恶性病变的产生";
            }else{
                ansModel.name = [NSString stringWithFormat:@"蒋林义%d",j];
                ansModel.content = @"甲状腺结节可以单发，也可以多发，多发结节比单发结节的发病率高，但单发结节甲状腺癌的发生率较高。甲状腺结节并发于各种甲状腺疾病，如单纯性甲状腺肿、甲状腺炎、甲状腺肿瘤等，其结节有单发或多发，临床上有良恶之分。良性中主要包括结节性甲状腺肿、甲状腺腺瘤等";
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
    
    HealthCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirendsCircleCellIdentifier];
    cell = [[HealthCircleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFirendsCircleCellIdentifier];
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
-(void)friendsCircleSupperCell:(HealthCircleCell *)cell
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
-(void)friendsCircleCell:(HealthCircleCell *)cell clickRow:(NSInteger)row lastCommentLabel:(UIView *)commentLabel
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
