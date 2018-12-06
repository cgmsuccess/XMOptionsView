//
//  ViewController.m
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "ViewController.h"
#import "XMBaseCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSMutableArray *imageSource = [NSMutableArray array];
    NSMutableArray *titileSource = [NSMutableArray array];
    for (int i = 0 ; i < 20; i ++) {
        [imageSource addObject:@"1.png"];
        [titileSource addObject:@"2222"];
    }
    XMBaseCollectionView *optionsView = [[XMBaseCollectionView new] setUpWithimageSouce:imageSource tititlSource:titileSource withFrame:CGRectMake(0, 60, KmainScreenWidth, 500) clickBlock:^(NSIndexPath *indexPath) {
        XMLog(@"%ld  %ld " ,indexPath.section,indexPath.row);
    }];
    
    [optionsView updateWithConfig:^(XMCollectionConfig *config) {
        config.minimumInteritemSpacingBlock(10).minimumLineSpacingBlock(10);
        config.itemTitileColorBlock([UIColor redColor]).itemTitileLabelTopSpacingBlock(5);
        config.itemSizeBlock(CGSizeMake((KmainScreenWidth - 50) / 4, (KmainScreenWidth - 50) / 4 + 26)).itemUIEdgeInsetsBlock(UIEdgeInsetsMake(0, 10, 10, 10)).scrollDirectionBlock(UICollectionViewScrollDirectionVertical);
    }];
    
    [self.view addSubview:optionsView];
}


@end
