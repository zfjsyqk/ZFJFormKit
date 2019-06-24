//
//  ZFJPlacehoderTextView.h
//  ZFJPlacehoderTextView
//
//  Created by ZFJ on 2018/6/25.
//  Copyright © 2018年 ZFJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFJPlacehoderTextView : UITextView

/**
 占位符
 */
@property (nonatomic,strong) NSString *placeholder;

/**
 占位符颜色
 */
@property (nonatomic,strong) UIColor *placeholderColor;

@end
