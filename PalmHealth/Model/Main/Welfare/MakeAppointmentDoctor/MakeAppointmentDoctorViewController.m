//
//  MakeAppointmentDoctorViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MakeAppointmentDoctorViewController.h"

@interface MakeAppointmentDoctorViewController ()

@end

@implementation MakeAppointmentDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUrl:_welfareModel.detailsURL];
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
