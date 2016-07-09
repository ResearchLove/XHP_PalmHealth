//
//  RootViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "RootViewController.h"
#import "NavigationViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:DEFAULT_GREEN_COLOR];
    
    NavigationViewController *welfareNavVC = [[NavigationViewController alloc]initWithRootViewController:self.welfareVC];
    NavigationViewController *myDoctorNavVC = [[NavigationViewController alloc]initWithRootViewController:self.myDoctorVC];
    NavigationViewController *healthInformationVC = [[NavigationViewController alloc]initWithRootViewController:self.healthServiceVC];
    NavigationViewController *personalCenterNavVC = [[NavigationViewController alloc]initWithRootViewController:self.personalCenterVC];
    [self setViewControllers:@[welfareNavVC,myDoctorNavVC,healthInformationVC,personalCenterNavVC]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Getter and Setter
 *
 */
-(WelfareViewController *)welfareVC
{
    if(_welfareVC == nil){
        _welfareVC = [[WelfareViewController alloc]init];
        [_welfareVC.tabBarItem setTitle:@"福利"];
        [_welfareVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_welfare"]];
        [_welfareVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_welfareSE"]];
    }
    return _welfareVC;
}

-(MyDoctorViewController *)myDoctorVC
{
    if (_myDoctorVC == nil) {
        _myDoctorVC = [[MyDoctorViewController alloc]init];
        [_myDoctorVC.tabBarItem setTitle:@"我的医生"];
        [_myDoctorVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_myDoctor"]];
        [_myDoctorVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_myDoctorSE"]];
    }
    return _myDoctorVC;
}

-(HealthServiceViewController *)healthServiceVC
{
    if (_healthServiceVC == nil) {
        _healthServiceVC = [[HealthServiceViewController alloc]init];
        [_healthServiceVC.tabBarItem setTitle:@"健康服务"];
        [_healthServiceVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_healthService"]];
        [_healthServiceVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_healthServiceSE"]];
    }
    return _healthServiceVC;
}

-(PersonalCenterViewController *)personalCenterVC
{
    if (_personalCenterVC == nil) {
        _personalCenterVC = [[PersonalCenterViewController alloc]init];
        [_personalCenterVC.tabBarItem setTitle:@"个人中心"];
        [_personalCenterVC.tabBarItem setImage:[UIImage imageNamed:@"tabbar_personalCenter"]];
        [_personalCenterVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabbar_personalCenterSE"]];
    }
    return _personalCenterVC;
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
