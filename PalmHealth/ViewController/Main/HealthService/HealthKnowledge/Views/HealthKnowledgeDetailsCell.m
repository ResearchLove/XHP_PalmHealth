//
//  HealthKnowledgeDetailsCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/25.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthKnowledgeDetailsCell.h"
#import <UIImageView+WebCache.h>
#import "UIColor+Chat.h"
#import "UIImage+Color.h"

@implementation HealthKnowledgeDetailsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.titleImageView];
        [self.contentView addSubview:self.contentsLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 15.0f;
    [super layoutSubviews];
    
    CGFloat spaceX = 15.0f;
    CGFloat spaceY = 15.0f;
    CGFloat labelWidth = self.frameWidth - spaceX * 2;
    CGSize size = [_titleLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
    
    spaceY = size.height + spaceX * 2;
    size = [_titleImageView sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    CGFloat imageHeight = labelWidth;
    [_titleImageView setFrame:CGRectMake(spaceX, spaceY, labelWidth, imageHeight)];
    
    spaceY += imageHeight + spaceX;
    size = [_contentsLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_contentsLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
    
    
}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _titleLabel;
}

-(UIImageView *)titleImageView
{
    if (_titleImageView == nil) {
        _titleImageView = [[UIImageView alloc]init];
    }
    return _titleImageView;
}

-(UILabel *)contentsLabel
{
    if (_contentsLabel == nil) {
        _contentsLabel = [[UILabel alloc]init];
        _contentsLabel.numberOfLines = 0;
        _contentsLabel.font = [UIFont systemFontOfSize:14.0f];
        _contentsLabel.textColor = [UIColor grayColor];

    }
    return _contentsLabel;
}

-(void)setHeaKnoDetModel:(HealthKnowledgeDetailsModel *)heaKnoDetModel
{
    [_titleLabel setText:heaKnoDetModel.title];
    [_titleImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEALTHKNOWLEDGE_IMAGE_HOST_URL,heaKnoDetModel.img]] placeholderImage:[UIImage imageWithColor:[UIColor colorGrayBG]]];
    [_contentsLabel setText:heaKnoDetModel.message];
}

+(CGFloat)cellHeightForModel:(HealthKnowledgeDetailsModel *)heaKnoDeaModel
{
     CGFloat titleHeight = [heaKnoDeaModel.title boundingRectWithSize:CGSizeMake(WIDTH_SCREEN - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16.0f]} context:nil].size.height;
     CGFloat contentHeight = [heaKnoDeaModel.message boundingRectWithSize:CGSizeMake(WIDTH_SCREEN - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} context:nil].size.height;
     CGFloat imageHeight = (WIDTH_SCREEN - 30) * 1.5;
     CGFloat height = titleHeight + contentHeight + imageHeight;
     return height;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
