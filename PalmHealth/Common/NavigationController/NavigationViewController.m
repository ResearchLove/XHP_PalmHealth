//
//  NavigationViewController.m
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:DEFAULT_NAVBAR_COLOR];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:DEFAULT_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
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
