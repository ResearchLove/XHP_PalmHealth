//
//  CommonTableViewCell.m
//  SmallWeChat
//
//  Created by apple on 15/12/6.
//  Copyright © 2015年 HaoHe. All rights reserved.
//

#import "CommonTableViewCell.h"


@implementation CommonTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _topLineStyle = CellLineStyleNone;
        _bottonLineStyle = CellLineStyleDefault;
    }
    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    [self.topLine setOriginY:0];
    [self.bottonLine setOriginY:self.frameHeight - _bottonLine.frameHeight];
    [self setBottonLineStyle:_bottonLineStyle];
    [self setTopLineStyle:_topLineStyle];
}


-(void)setTopLineStyle:(CellLineStyle)style
{
    _topLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.topLine setOriginX:_leftFreeSpace];
        [self.topLine setFrameWidth:self.frameWidth];
        [self.topLine setHidden:NO];
    }else if(style == CellLineStyleFill){
        [self.topLine setOriginX:0];
        [self.topLine setFrameWidth:self.frameWidth];
        [self.topLine setHidden:NO];
    }else if(style == CellLineStyleNone){
        [self.topLine setHidden:YES];
    
    }
}

-(void)setBottonLineStyle:(CellLineStyle)style
{
    _bottonLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.bottonLine setOriginX:_leftFreeSpace];
        [self.bottonLine setFrameWidth:self.frameWidth];
        [self.bottonLine setHidden:NO];
    }else if(style == CellLineStyleFill){
        [self.bottonLine setOriginX:0];
        [self.bottonLine setFrameWidth:self.frameWidth];
        [self.bottonLine setHidden:NO];
    }else if(style == CellLineStyleNone){
        [self.bottonLine setHidden:YES];
    }

}

-(UIView *)bottonLine
{
    if (_bottonLine == nil) {
        _bottonLine = [[UIView alloc]init];
        [_bottonLine setFrameHeight:0.5f];
        [_bottonLine setBackgroundColor:[UIColor grayColor]];
        [_bottonLine setAlpha:0.4];
        [self.contentView addSubview:_bottonLine];
    }
    return _bottonLine;
}

-(UIView *)topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc]init];
        [_topLine setFrameHeight:0.5f];
        [_topLine setBackgroundColor:[UIColor grayColor]];
        [_topLine setAlpha:0.4];
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
