//
//  ZFJFormConfig.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/24.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFJFormConfig : NSObject

@property (nonatomic,strong) UIColor *backgroundColor;

/**
 分组头部视图
 */
@property (nonatomic,strong) UIColor *headerViewBgColor;

/**
 分组头部高度（默认0）
 */
@property (nonatomic,assign) CGFloat heightHeader;

/**
 分组尾部视图
 */
@property (nonatomic,strong) UIColor *footerViewBgColor;

/**
 分组尾部高度（默认0）
 */
@property (nonatomic,assign) CGFloat heightFooter;

@end

NS_ASSUME_NONNULL_END
