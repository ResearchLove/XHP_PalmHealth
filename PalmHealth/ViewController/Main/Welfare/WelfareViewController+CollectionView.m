//
//  WelfareViewController+CollectionView.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareViewController+CollectionView.h"
#import "WelfareItemCell.h"
#import "WelfareHeaderCell.h"
#import "UIView+Frame.h"
#import "DiseaseConsultingViewController.h"
#import "HospitalRankViewController.h"
#import "MakeAppointmentDoctorViewController.h"
#import "PutianHospitalViewController.h"
#import "SpringInternationalViewController.h"
#import "VaccinationPointViewController.h"

@implementation WelfareViewController (CollectionView)

-(void)registerCellForCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:[WelfareItemCell class] forCellWithReuseIdentifier:@"WelfareItemCell"];
    [collectionView registerClass:[WelfareHeaderCell class] forCellWithReuseIdentifier:@"WelfareHeaderCell"];
}

/**
 *  UICollectionViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.welfareItemDataAry.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        WelfareHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WelfareHeaderCell" forIndexPath:indexPath];
        return cell;
    }
    
    WelfareItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WelfareItemCell" forIndexPath:indexPath];
    WelfareModel *welfareModel = [self.welfareItemDataAry objectAtIndex:indexPath.row];
    cell.welfareModel = welfareModel;
    return cell;
}

/**
 *  UICollectionViewDelegate
 *
 */
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(collectionView.frameWidth, collectionView.frameHeight - (WIDTH_CELL * 2) - HEIGHT_STATUSBAR - HEIGHT_NAVBAR - HEIGHT_TABBAR);
    }
    return CGSizeMake(WIDTH_CELL, WIDTH_CELL);
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return  0;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return;
    }
    WelfareModel *welfareModel = [self.welfareItemDataAry objectAtIndex:indexPath.row];
    if ([welfareModel.title isEqualToString:@"疾病咨询"]) {
        DiseaseConsultingViewController *disConVC = [[DiseaseConsultingViewController alloc]init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:disConVC animated:YES];
        
    }else if ([welfareModel.title isEqualToString:@"春雨国际"]) {
        SpringInternationalViewController *sprIntVC = [[SpringInternationalViewController alloc]init];
        sprIntVC.welfareModel = welfareModel;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:sprIntVC animated:YES];
    }else if ([welfareModel.title isEqualToString:@"预约就诊"]) {
        PutianHospitalViewController *putiaVC = [[PutianHospitalViewController alloc]init];
        putiaVC.welfareModel = welfareModel;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:putiaVC animated:YES];
        
    }else if ([welfareModel.title isEqualToString:@"疫苗接种点"]) {
        VaccinationPointViewController *vacPoiVC = [[VaccinationPointViewController alloc]init];
        vacPoiVC.welfareModel = welfareModel;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:vacPoiVC animated:YES];
        
    }else if ([welfareModel.title isEqualToString:@"医院排名"]) {
        HospitalRankViewController *hosRanVC = [[HospitalRankViewController alloc]init];
        hosRanVC.welfareModel = welfareModel;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:hosRanVC animated:YES];
    }else if ([welfareModel.title isEqualToString:@"莆田系医院"]) {
        PutianHospitalViewController *putiaVC = [[PutianHospitalViewController alloc]init];
        putiaVC.welfareModel = welfareModel;
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:putiaVC animated:YES];
    }
}

@end
