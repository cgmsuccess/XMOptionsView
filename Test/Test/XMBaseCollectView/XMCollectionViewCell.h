//
//  XMCollectionViewCell.h
//  Test
//
//  Created by 链派社区 on 2018/11/28.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
/* 保证cell的纯洁，所有不使用模型 */

#import <UIKit/UIKit.h>
@class XMCollectionConfig;
@interface XMCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)UIImageView *customImageView ; ///<
@property (nonatomic,strong)UILabel *titieLabel ; ///<
@property (nonatomic,strong)XMCollectionConfig *config ; ///< 

@end
