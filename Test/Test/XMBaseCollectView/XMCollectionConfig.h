//
//  XMCollectionConfig.h
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XMCollectionConfig : NSObject

+ (instancetype)defaultConfig;

@property (nonatomic,assign)CGFloat minimumLineSpacing; ///<设置最小行间距
@property (nonatomic,assign)CGFloat minimumInteritemSpacing; ///设置最小列间距

@property (nonatomic,assign)UIEdgeInsets itemEdgeInsets; ///< item边距
@property (nonatomic,assign)CGSize itemSize; ///< item 大小
@property (nonatomic,assign)CGFloat itemTitileLabelTopSpacing; ///< titleLabel 距离顶部的距离 默认 为 6
@property (nonatomic,strong)UIColor *itemTitileColor; ///< titleLabel 颜色  默认 rgb 98 98 98

@property (nonatomic,assign)UICollectionViewScrollDirection collectionViewScrollDirection; ///< 水平滑动还是垂直滑动，默认垂直



@property (nonatomic,copy,readonly)XMCollectionConfig *(^minimumLineSpacingBlock)(CGFloat minimumLineSpacing) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^minimumInteritemSpacingBlock)(CGFloat minimumInteritemSpacing) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^itemUIEdgeInsetsBlock)(UIEdgeInsets itemEdgeInsets) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^itemSizeBlock)(CGSize itemSize) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^scrollDirectionBlock)(UICollectionViewScrollDirection scrollDirection) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^itemTitileLabelTopSpacingBlock)(CGFloat topSpacing) ; ///<
@property (nonatomic,copy,readonly)XMCollectionConfig *(^itemTitileColorBlock)(UIColor *titleColor) ; ///<

@end
