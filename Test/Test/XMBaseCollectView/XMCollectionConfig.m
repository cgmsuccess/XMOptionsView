//
//  XMCollectionConfig.m
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMCollectionConfig.h"
#import "XMCollectionHeader.h"
@implementation XMCollectionConfig

+ (instancetype)defaultConfig
{
    XMCollectionConfig *config = [[XMCollectionConfig alloc] init];
    config.minimumInteritemSpacing = 10;
    config.minimumLineSpacing = 10;
    config.itemEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    config.itemSize = CGSizeMake(KmainScreenWidth / 5, KmainScreenWidth / 5 + 21);
    config.collectionViewScrollDirection = UICollectionViewScrollDirectionVertical;
    config.itemTitileLabelTopSpacing = 6;
    config.itemTitileColor = RGB_GrayColor(98);
    return config;
}

-(XMCollectionConfig *(^)(CGFloat))minimumLineSpacingBlock
{
    return ^(CGFloat minimumLineSpac){
        self.minimumLineSpacing = minimumLineSpac;
        return self;
    };
}

-(XMCollectionConfig *(^)(CGFloat))minimumInteritemSpacingBlock
{
    return ^(CGFloat minimumInteritemSpacing){
        self.minimumInteritemSpacing = minimumInteritemSpacing;
        return self;
    };
}

-(XMCollectionConfig *(^)(UIEdgeInsets))itemUIEdgeInsetsBlock
{
    return ^(UIEdgeInsets itemEdgeInsets){
        self.itemEdgeInsets = itemEdgeInsets;
        return self;
    };
}

-(XMCollectionConfig *(^)(UICollectionViewScrollDirection))scrollDirectionBlock
{
    return ^(UICollectionViewScrollDirection scrollDirection){
        self.collectionViewScrollDirection = scrollDirection;
        return self;
    };
}

-(XMCollectionConfig *(^)(CGSize))itemSizeBlock
{
    return ^(CGSize itemSize){
        self.itemSize = itemSize;
        return self;
    };
}

-(XMCollectionConfig *(^)(CGFloat))itemTitileLabelTopSpacingBlock
{
    return ^(CGFloat topSpacing){
        self.itemTitileLabelTopSpacing = topSpacing;
        return self;
    };
}

-(XMCollectionConfig *(^)(UIColor *))itemTitileColorBlock
{
    return ^(UIColor *titleColor){
        self.itemTitileColor = titleColor;
        return self;
    };
}

@end
