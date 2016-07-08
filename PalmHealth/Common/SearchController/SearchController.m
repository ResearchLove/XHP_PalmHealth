//
//  SearchController.m
//  SmallWeChat
//
//  Created by xiaohaiping on 16/5/31.
//  Copyright © 2016年 HaoHe. All rights reserved.
//

#import "SearchController.h"
#import "UIImage+Color.h"
#import "UIColor+Chat.h"
#import "UIView+Extensions.h"
#import <View+MASShorthandAdditions.h>

@interface SearchController ()

@end

@implementation SearchController

-(id)initWithSearchResultsController:(UIViewController *)searchResultsController
{
    if(self = [super initWithSearchResultsController:searchResultsController]){
        [self.searchBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorGrayBG]]];
        [self.searchBar setBarTintColor:[UIColor colorGrayBG]];
        [self.searchBar setTintColor:[UIColor colorGreenDefault]];
        UITextField *tf = [[[self.searchBar.subviews firstObject] subviews]lastObject];
        [tf.layer setMasksToBounds:YES];
        [tf.layer setBorderWidth:BORDER_WIDTH_1PX];
        [tf.layer setBorderColor:[UIColor colorGrayLine].CGColor];
        [tf.layer setCornerRadius:5.0f];
        
        for (UIView *view in self.searchBar.subviews[0].subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]){
                UIView *bg = [[UIView alloc]init];
                [bg setBackgroundColor:[UIColor colorGrayBG]];
                [view addSubview:bg];
                [bg mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(0);
                }];
                
                UIView *line = [[UIView alloc]init];
                [line setBackgroundColor:[UIColor colorGrayLine]];
                [view addSubview:line];
                [line mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.and.right.and.bottom.mas_equalTo(0);
                    make.height.mas_equalTo(BORDER_WIDTH_1PX);
                }];
                break;
            }
        }
    }
    return self;
}

-(void)setShowVoiceButton:(BOOL)showVoiceButton
{
    _showVoiceButton = showVoiceButton;
    if (showVoiceButton) {
        [self.searchBar setShowsBookmarkButton:YES];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
        [self.searchBar setImage:[UIImage imageNamed:@"searchBar_voice_HL"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    }else{
        [self.searchBar setShowsBookmarkButton:NO];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
