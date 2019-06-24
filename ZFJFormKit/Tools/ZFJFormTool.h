//
//  ZFJFormTool.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ZFJFormModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZFJFormTool : NSObject

/**
 动态计算宽高
 
 @param str 文本
 @param width 宽度
 @param height 高度
 @param font 字体
 @return CGRect
 */
+ (CGRect)dynamicHeight:(NSString *)str width:(CGFloat)width height:(CGFloat)height font:(UIFont *)font;

/**
 对值进行验证

 @param dataArray 数据源数组
 @return 成功或者失败（YES||NO）
 */
+ (BOOL)validateDataArray:(NSArray<ZFJFormModel *> *)dataArray;

/**
 对分组数据源数组的值进行验证

 @param sectionsDataArray 分组数据源数组
 @return 成功或者失败（YES||NO）
 */
+ (BOOL)validateSectionsDataArray:(NSArray<NSArray *> *)sectionsDataArray;

@end

NS_ASSUME_NONNULL_END
