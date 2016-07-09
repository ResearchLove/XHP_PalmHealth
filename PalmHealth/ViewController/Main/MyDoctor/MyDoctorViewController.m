//
//  MyDoctorViewController.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyDoctorViewController.h"
#import "MyDoctorCell.h"
#import "HealthServiceModel.h"
#import "MyDoctorHelper.h"
#import "MyDoctorSearchViewController.h"
#import "DepartmentListViewController.h"
#import "MyDoctorHeaderView.h"
#import "MyDoctorModel.h"
#import "DoctorDetailsViewController.h"

@interface MyDoctorViewController () <UISearchBarDelegate>
@property (nonatomic,strong) UISearchController *searchController;

@property (nonatomic,strong) MyDoctorSearchViewController*myDocSeaVC;

@property (nonatomic,strong) DepartmentListViewController *depLisVC;
@end

@implementation MyDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"我的医生"];
    
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:DEFAULT_NAVBAR_COLOR];
    
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    
    [self.tableView registerClass:[MyDoctorAddCell class] forCellReuseIdentifier:@"MyDoctorAddCell"];
    [self.tableView registerClass:[MyDoctorMembersCell class] forCellReuseIdentifier:@"MyDoctorMembersCell"];
    [self.tableView registerClass:[MyDoctorHeaderView class] forHeaderFooterViewReuseIdentifier:@"MyDoctorHeaderView"];
    
    /*
    MyDoctorHelper *myDocHelper = [[MyDoctorHelper alloc]init];
    self.funcionGroupAry = myDocHelper.funcionGroupAry;
    */

    // Do any additional setup after loading the view.
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
    
  
}


/**
 *  UITabelViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataAry.count + 1;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _funcionGroupAry.count;
    }
    NSArray *array = [_dataAry objectAtIndex:section -1];
    return array.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HealthServiceModel *heaSerModel = [_funcionGroupAry objectAtIndex:indexPath.row];
        MyDoctorAddCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDoctorAddCell"];
        [cell setHeaSerModel:heaSerModel];
        [cell setTopLineStyle:CellLineStyleNone];
        indexPath.row == _funcionGroupAry.count - 1 ? [cell setBottonLineStyle:CellLineStyleNone] :[cell setBottonLineStyle:CellLineStyleDefault];
        return cell;
    }else{
        MyDoctorModel *myDoctorModel = [_dataAry[indexPath.section -1] objectAtIndex:indexPath.row];
        MyDoctorMembersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDoctorMembersCell"];
        cell.attentionBtn.hidden = YES;
        cell.myDocModel = myDoctorModel;
        if (indexPath.row == [_dataAry[indexPath.section -1] count] - 1) {
            indexPath.section == _dataAry.count ? [cell setBottonLineStyle:CellLineStyleFill] :[cell setBottonLineStyle:CellLineStyleNone];
        }else{
            [cell setBottonLineStyle:CellLineStyleDefault];
        }
        return cell;
    }
}

/**
 *  UITabelViewDelegate
 *
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 22.0f;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    MyDoctorHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MyDoctorHeaderView"];
    [view setTitle:[self.sectionAry objectAtIndex:section]];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setHidesBottomBarWhenPushed:YES];
    if (indexPath.section == 0) {
        [self.navigationController pushViewController:self.depLisVC animated:YES];
    }else{
        MyDoctorModel *myDoctorModel = [_dataAry[indexPath.section -1] objectAtIndex:indexPath.row];
        DoctorDetailsViewController *docDetVC = [[DoctorDetailsViewController alloc]init];
        docDetVC.myDoctorModel = myDoctorModel;
        [self.navigationController pushViewController:docDetVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**
 *  拼音首字母检索
 *
 */
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sectionAry;
}

/**
 *  检索时空出搜索框
 *
 */
- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:_searchController.searchBar.frame animated:NO];
        return -1;
    }
    return index;
}

/**
 *  Getter and Setter
 */
- (MyDoctorSearchViewController *) myDocSeaVC
{
    if (_myDocSeaVC == nil) {
        _myDocSeaVC = [[MyDoctorSearchViewController alloc] init];
    }
    return _myDocSeaVC;
}

-(DepartmentListViewController *)depLisVC
{
    if(_depLisVC == nil){
        _depLisVC = [[DepartmentListViewController alloc]init];
    }
    return _depLisVC;

}

- (UISearchController *) searchController
{
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.myDocSeaVC];
        [_searchController setSearchResultsUpdater: self.myDocSeaVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setBarTintColor:DEFAULT_SEARCHBAR_COLOR];
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setDelegate:self];
        [_searchController.searchBar.layer setBorderWidth:0.5f];
        [_searchController.searchBar.layer setBorderColor:WBColor(220, 220, 220, 1.0).CGColor];
    }
    return _searchController;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MyDoctorHelper *myDocHelper = [[MyDoctorHelper alloc]init];
    self.funcionGroupAry = myDocHelper.funcionGroupAry;
    self.dataAry = myDocHelper.dataAry;
    self.sectionAry = myDocHelper.sectionAry;
    [self.tableView reloadData];

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
