//
//  XMBaseCollectionView.h
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMCollectionConfig.h"
#import "XMCollectionHeader.h"

@interface XMBaseCollectionView : UIView

typedef void (^clickBlock)(NSIndexPath *indexPath);

- (XMBaseCollectionView *)setUpWithimageSouce: (NSArray *)imageSource tititlSource: (NSArray *)titleSource withFrame:(CGRect)frame clickBlock:(clickBlock)clickBlock;

- (void)updateWithConfig: (void(^)(XMCollectionConfig *config))configBlock;


@end
