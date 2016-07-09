//
//  WelfareViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareViewController.h"
#import "WelfareHelper.h"
#import "WelfareViewController+CollectionView.h"

@interface WelfareViewController ()

@end

@implementation WelfareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"福利"];
    
    [self.view addSubview:self.collectionView];
    [self registerCellForCollectionView:self.collectionView];
    
    WelfareHelper *welfareHelper = [[WelfareHelper alloc]init];
    self.welfareItemDataAry = welfareHelper.welfareItemDataAry;
        
    // Do any additional setup after loading the view.
}

/**
 * Getter and Setter
 *
 */
-(UICollectionView *)collectionView
{

    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        [_collectionView setAllowsSelection:YES];
    }
    return _collectionView;

}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
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
