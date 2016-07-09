//
//  HealthKnowledgeCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeCell.h"

@implementation HealthKnowledgeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    
    CGFloat spaceX = 15.0f;
    CGFloat labelHeight = 30;
    CGFloat spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth * 0.8;
    CGSize size =  [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth :size.width;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, labelWidth, labelHeight)];
    
    [super layoutSubviews];
   
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _titleLabel;
}

-(void)setHeaKnoModel:(HealthKnowledgeModel *)heaKnoModel
{
    [_titleLabel setText:heaKnoModel.name];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
