//
//  XMCollectionViewCell.m
//  Test
//
//  Created by 链派社区 on 2018/11/28.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMCollectionViewCell.h"
#import "XMCollectionHeader.h"
#import "XMCollectionConfig.h"
@interface XMCollectionViewCell()



@end

@implementation XMCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         [self setUI];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    [self addSubview:self.customImageView];
    [self addSubview:self.titieLabel];
    self.contentView.backgroundColor = RandomColor;
    [self setconstraint];
}

-(void)setconstraint
{
    [self.customImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.width.mas_equalTo(self.mas_width).offset(0);
    }];
    
    [self.titieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.customImageView.mas_bottom).offset(6);
        make.height.mas_equalTo(21);
        make.width.mas_equalTo(self.mas_width).offset(0);
    }];
}

-(void)setConfig:(XMCollectionConfig *)config
{
    _config = config;
    self.titieLabel.textColor = [config itemTitileColor];
    [self.titieLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.customImageView.mas_bottom).offset(config.itemTitileLabelTopSpacing);
    }];
}

#pragma mark Lazy

-(UIImageView *)customImageView
{
    if (!_customImageView) {
        _customImageView = [[UIImageView alloc] init];
    }
    return _customImageView;
}

-(UILabel *)titieLabel
{
    if (!_titieLabel) {
        _titieLabel = [[UILabel alloc] init];
        _titieLabel.textAlignment = NSTextAlignmentCenter;
        _titieLabel.textColor = RGB_Color(98, 98, 98);
    }
    return _titieLabel;
}

@end
