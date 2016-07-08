//
//  CommonWebViewController.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/25.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "CommonWebViewController.h"
#import <MobClick.h>
#import "UIBarButtonItem+Action.h"
#import "UIColor+Chat.h"
#import "UIView+Frame.h"

#define     WEBVIEW_NAVBAR_ITEMS_FIXED_SPACE    9

@interface CommonWebViewController () <WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) UIBarButtonItem *backButtonItem;
@property (nonatomic,strong) UIBarButtonItem *closeButtonItem;
@property (nonatomic,strong) UILabel *authLabel;

@end

@implementation CommonWebViewController

-(id)init
{
    if (self = [super init]) {
        self.useMPageTitleAsNavTitle = YES;
        self.showLoadingProgress = YES;
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    [self.view addSubview:self.authLabel];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.view setBackgroundColor:[UIColor colorBlackBG]];
    [self.webView.scrollView setBackgroundColor:[UIColor clearColor]];
    for (id vc in self.webView.scrollView.subviews) {
        NSString *className = NSStringFromClass([vc class]);
        if ([className isEqualToString:@"WKContentView"]) {
            [vc setBackgroundColor:[UIColor whiteColor]];
        }
    }
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [self.webView.scrollView addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew context:NULL];
    // Do any additional setup after loading the view.
}

/**
 *  Getter and Setter
 *
 *  @return
 */
- (WKWebView *)webView
{
    if (_webView == nil) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, HEIGHT_NAVBAR + HEIGHT_STATUSBAR, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_NAVBAR - HEIGHT_STATUSBAR)];
        [_webView setAllowsBackForwardNavigationGestures:YES];
        [_webView setNavigationDelegate:self];
    }
    return _webView;
}

-(UIProgressView *)progressView
{
    if (_progressView == nil) {
        _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(0, HEIGHT_NAVBAR + HEIGHT_STATUSBAR, WIDTH_SCREEN, 10.0f)];
        [_progressView setTransform:CGAffineTransformMakeScale(1.0f, 2.0f)];
        [_progressView setProgressTintColor:[UIColor colorGreenDefault]];
        [_progressView setTrackTintColor:[UIColor clearColor]];
    }
    return _progressView;
}

-(UIBarButtonItem *)backButtonItem
{
    if (_backButtonItem == nil) {
        _backButtonItem = [[UIBarButtonItem alloc]initWithBackTitle:@"返回" traget:self action:@selector(navBackButotnDown)];
    }
    return _backButtonItem;
}

-(UIBarButtonItem *)closeButtonItem
{
    if (_closeButtonItem == nil) {
        _closeButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(navCloseButtonDown)];
    }
    return _closeButtonItem;
}

-(UILabel *)authLabel
{
    if (_authLabel == nil) {
        _authLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT_NAVBAR + HEIGHT_STATUSBAR + 13, WIDTH_SCREEN - 40, 0)];
        [_authLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_authLabel setTextAlignment:NSTextAlignmentCenter];
        [_authLabel setTextColor:[UIColor colorTextGray]];
        [_authLabel setNumberOfLines:0];
    }
    return _authLabel;
}


-(void)navBackButotnDown
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
        [self.navigationItem setLeftBarButtonItems:@[[UIBarButtonItem fixItemSpace:-WEBVIEW_NAVBAR_ITEMS_FIXED_SPACE],self.backButtonItem, self.closeButtonItem]];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)navCloseButtonDown
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/**
 *  WKNavigationDelegate
 *
 *  @param webView
 *  @param navigation
 */
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    if (self.useMPageTitleAsNavTitle) {
        [self.navigationItem setTitle:webView.title];
        [self.authLabel setText:[NSString stringWithFormat:@"网页由 %@ 提供",webView.URL.host]];
        [self.authLabel setHeight:[self.authLabel sizeThatFits:CGSizeMake(self.authLabel.frameWidth, MAXFLOAT)].height];
    }
}


-(void)setUrl:(NSString *)url
{
    _url = url;
    if ([self.view isFirstResponder]) {
        [self.progressView setProgress:0.0f];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    }
}

/**
 *  设置加载条进度
 *
 *  @param showLoadingProgress
 */
-(void)setShowLoadingProgress:(BOOL)showLoadingProgress
{
    _showLoadingProgress = showLoadingProgress;
    [self.progressView setHidden:!showLoadingProgress];
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (self.showLoadingProgress && [keyPath isEqualToString:@"estimatedProgress"] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        if(self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }else if([keyPath isEqualToString:@"backgroundColor"] && object == self.webView.scrollView){
        UIColor *color = [change objectForKey:@"new"];
        if (!CGColorEqualToColor(color.CGColor, [UIColor clearColor].CGColor)) {
            [object setBackgroundColor:[UIColor clearColor]];
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"WebVC"];
    [self.progressView setProgress:0.0f];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    if (!self.disableBackButton && self.navigationItem.leftBarButtonItems.count <= 2) {
        [self.navigationItem setLeftBarButtonItems:@[[UIBarButtonItem fixItemSpace:-WEBVIEW_NAVBAR_ITEMS_FIXED_SPACE], self.backButtonItem]];
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [MobClick endLogPageView:@"WebVC"];
    
}

-(void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView.scrollView removeObserver:self forKeyPath:@"backgroundColor"];
    
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc WebVC");
#endif
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
