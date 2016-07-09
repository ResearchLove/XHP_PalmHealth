//
//  WelfareViewController+CollectionView.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/27.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "WelfareViewController.h"

#define         WIDTH_CELL  WIDTH_SCREEN / 3


@interface WelfareViewController (CollectionView)<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(void)registerCellForCollectionView:(UICollectionView *)collectionView;

@end
