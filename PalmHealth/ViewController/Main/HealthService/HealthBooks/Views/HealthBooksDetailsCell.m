//
//  HealthBooksDetailsCell.m
//  PalmHealth
//
//  Created by xiaohaiping on 16/6/30.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "HealthBooksDetailsCell.h"

@implementation HealthBooksDetailsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self.contentView addSubview:self.contentLabel];
    }
    return self;


}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat spaceX = 15.0f;
    CGFloat spaceY = 0;
    CGFloat labelWidth = self.frameWidth - spaceX  * 2;
    CGSize size = [_contentLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
    size.width = size.width > labelWidth ? labelWidth : size.width;
    [_contentLabel setFrame:CGRectMake(spaceX, spaceY, size.width, size.height)];
}

-(UILabel *)contentLabel
{
    if(_contentLabel == nil){
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:16.0f];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

-(void)setHeaBooDetModel:(HealthBooksDetailsModel *)heaBooDetModel
{
    [_contentLabel setText:((HealthBooksContentsModel *)[heaBooDetModel.listAry objectAtIndex:0]).message];

}

+(CGFloat)cellHeightForModel:(HealthBooksDetailsModel *)heaBooDetModel
{
    CGFloat contentHeight = [((HealthBooksContentsModel *)[heaBooDetModel.listAry objectAtIndex:0]).message boundingRectWithSize:CGSizeMake(WIDTH_SCREEN - 30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:16.0f]} context:nil].size.height;
    CGFloat height = contentHeight;
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
