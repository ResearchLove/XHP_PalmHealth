//
//  WelfareViewController.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/19.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonViewController.h"
#import "WelfareModel.h"

@interface WelfareViewController : CommonViewController

@property (strong,nonatomic) UICollectionView *collectionView;

@property (strong,nonatomic) NSMutableArray *welfareItemDataAry;

@end
