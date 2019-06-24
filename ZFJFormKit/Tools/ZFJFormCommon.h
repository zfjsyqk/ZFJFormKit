//
//  ZFJFormCommon.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#ifndef ZFJFormCommon_h
#define ZFJFormCommon_h

//屏幕的物理宽度
#define ZFJForm_ScreenWidth    [UIScreen mainScreen].bounds.size.width

//屏幕的物理高度
#define ZFJForm_ScreenHeight   [UIScreen mainScreen].bounds.size.height

#define WEAKBLOCK __weak typeof(self) weakSelf = self;

//向右小图标的大小
#define KLeftImgViewSize 15.0

//有没有刘海
#define IsHaveLiuHai ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896.0)
#define KNavBarHei (IsHaveLiuHai ? 88 : 64)
#define KTabBarHei (IsHaveLiuHai ? 83 : 49)


#endif /* ZFJFormCommon_h */
