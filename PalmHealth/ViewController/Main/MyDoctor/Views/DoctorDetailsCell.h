//
//  DoctorDetailsCell.h
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "MyDoctorModel.h"

@interface DoctorDetailsOneCell : CommonTableViewCell

@property (strong,nonatomic) UIImageView *userImgeView;
@property (strong,nonatomic) UILabel *userNmeLabel;
@property (strong,nonatomic) UILabel *levelLabel;
@property (strong,nonatomic) UILabel *hospitalLabel;

@property (strong,nonatomic) MyDoctorModel *myDocModel;


@end

@interface DoctorDetailsTwoCell : CommonTableViewCell

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *subTitleLabel;

@property (strong,nonatomic) MyDoctorModel *myDocModel;

+(CGFloat)cellHeightForModel:(MyDoctorModel *)myDoctorModel;

@end

@interface DoctorDetailsThreeCell : CommonTableViewCell

@property (strong,nonatomic) UILabel *titleLabel;

@property (assign,nonatomic) NSInteger sectionNumber;

@property (strong,nonatomic) MyDoctorModel *myDocModel;

@end
