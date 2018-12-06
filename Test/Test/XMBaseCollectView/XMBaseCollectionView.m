//
//  XMBaseCollectionView.m
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#import "XMBaseCollectionView.h"
#import "XMCollectionViewCell.h"  /// cell
#import "XMCollectionConfig.h"  ////configer

NSString *xmCell = @"XMCollectionViewCell";
NSString *xmHeader = @"xmHeader";
NSString *xmFooter = @"xmFooter";

@interface XMBaseCollectionView()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collectionView ; ///<
@property (nonatomic,strong)UICollectionViewFlowLayout *layout ; ///<

@property (nonatomic,strong)NSMutableArray * imageArr; ///< 图片数组
@property (nonatomic,strong)NSMutableArray * titleArr ; ///< 字符数组

@property (nonatomic,strong)XMCollectionConfig * config; ///< collection 配置

@property (nonatomic, copy) clickBlock clickItemBlock;

@end

@implementation XMBaseCollectionView

-(XMBaseCollectionView *)setUpWithimageSouce:(NSArray *)imageSource tititlSource:(NSArray *)titleSource withFrame:(CGRect)frame clickBlock:(clickBlock)clickBlock
{
    _titleArr = titleSource.mutableCopy;
    _imageArr = imageSource.mutableCopy;
    self.clickItemBlock = clickBlock;
    self.frame = frame;
    [self setUI];
    return self;
}

-(void)setUI
{
    [self addSubview:self.collectionView];
}

#pragma mark 接口
-(void)updateWithConfig:(void (^)(XMCollectionConfig *))configBlock
{
    self.layout.minimumLineSpacing = self.config.minimumLineSpacing ;//设置最小行间距
    self.layout.minimumInteritemSpacing = self.config.minimumInteritemSpacing;//设置最小列间距
    self.layout.scrollDirection = self.config.collectionViewScrollDirection; //水平还是垂直滑动
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDelegateFlowLayout,UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:xmCell forIndexPath:indexPath];
    
    if (indexPath.row == _imageArr.count - 1) {
        XMLog(@"cell.frame = %@" , NSStringFromCGRect(cell.frame));
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMCollectionViewCell *customCell = (XMCollectionViewCell *)cell;
    customCell.customImageView.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    customCell.titieLabel.text = _titleArr[indexPath.row];
    customCell.config = self.config;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickItemBlock) {
        self.clickItemBlock(indexPath);
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.config.itemEdgeInsets;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.config.itemSize;
}

#pragma mark lazy

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        [_collectionView registerClass:[XMCollectionViewCell class] forCellWithReuseIdentifier:xmCell];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:xmHeader];  //  一定要设置
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;
    }
    return _collectionView;
}

-(UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.config.itemSize;
        _layout.minimumLineSpacing = self.config.minimumLineSpacing ;//设置最小行间距
        _layout.minimumInteritemSpacing = self.config.minimumInteritemSpacing;//设置最小列间距
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
    }
    return _layout;
}

-(XMCollectionConfig *)config
{
    if (!_config) {
        _config = [XMCollectionConfig defaultConfig];
    }
    return _config;
}

@end
