//
//  HealthBooksDetailsViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/29.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksDetailsViewController.h"
#import "UIColor+Chat.h"
#import "HealthBooksDetailsCell.h"
#import "HealthBooksDetailsViewController+Data.h"
#import "NavigationBar.h"


@interface HealthBooksDetailsViewController ()

@end

@implementation HealthBooksDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    [self.navigationItem setTitle:@"图书详情"];
    
    [self.tableView setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView registerClass:[HealthBooksDetailsCell class] forCellReuseIdentifier:@"HealthBooksDetailsCell"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    [self loadData];
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthBooksDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HealthBooksDetailsCell"];
    cell.heaBooDetModel = _heaBooDeaModel;
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleNone];
    return cell;
}


/**
 * UITableViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HealthBooksDetailsCell cellHeightForModel:_heaBooDeaModel];
}

/**
 *  Getter and Setter
 *
 */
-(HealthBooksDataViewModel *)heaBooDatViewModel
{
    if (_heaBooDatViewModel == nil) {
        _heaBooDatViewModel = [[HealthBooksDataViewModel alloc]init];
    }
    return _heaBooDatViewModel;
}

-(void)backEvent:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
