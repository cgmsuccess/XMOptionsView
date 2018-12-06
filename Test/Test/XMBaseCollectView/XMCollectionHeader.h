//
//  XMCollectionHeader.h
//  Test
//
//  Created by 链派社区 on 2018/11/23.
//  Copyright © 2018年 风吹裤衩. All rights reserved.
//

#ifndef XMCollectionHeader_h
#define XMCollectionHeader_h

#import "Masonry.h"
//弱引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

//颜色
#define randomColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RandomColor [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0f]

#define RGBA_Color(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_Color(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define RGBA_GrayColor(W , A) [UIColor colorWithRed:((W) / 255.0f) green:((W) / 255.0f) blue:((W) / 255.0f) alpha:A]
#define RGB_GrayColor(W) [UIColor colorWithRed:((W) / 255.0f) green:((W) / 255.0f) blue:((W) / 255.0f) alpha:1.0f]

#define KmainScreenWidth [UIScreen mainScreen].bounds.size.width
#define KmainScreenHeiht [UIScreen mainScreen].bounds.size.height

//设备的比例系数
#define ScaleNumberWidth KmainScreenWidth/375
#define ScaleNumberHeight KmainScreenHeiht/667

/**  自定义打印打印   */
#ifdef DEBUG
#define XMLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define XMLog(format, ...)
#endif


#endif /* XMCollectionHeader_h */
