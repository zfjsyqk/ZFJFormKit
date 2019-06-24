//
//  ZFJFormModel.h
//  ZFJFormKit
//  
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZFJFormCellConfig.h"

@class ZFJFormModel;

typedef NS_ENUM(NSInteger, ZFJFormCellType) {
    KFormCellLabelType = 0,      //只信息展示，不能编辑
    KFormCellHeadImgType = 1,    //头像
    KFormCellTextFieldType = 2,  //单行输入
    KFormCellTextViewType = 3,   //多行输入
    KFormCellSwitchType = 4,     //右侧开关
    KFormCellCustomType = 5      //自定义CELL
};

typedef void(^ZFJValueDidChangedBlock)(NSString * _Nullable vlaue);
typedef BOOL(^ZFJValidateBlock)(ZFJFormModel * _Nullable model);
typedef void(^ZFJCustomEventBlock)(id _Nonnull obj);

NS_ASSUME_NONNULL_BEGIN

@interface ZFJFormModel : NSObject

/**
 Cell的类型
 */
@property (nonatomic,assign) ZFJFormCellType formCellType;

/**
 标题
 */
@property (nonatomic,  copy) NSString *title;

/**
 左边Icon图标
 */
@property (nonatomic,  copy) UIImage *iconImg;

/**
 右侧空间的值(如果是switch，value == nil关闭，value ！= nil打开)
 */
@property (nonatomic,  copy) NSString *value;

/**
 头像（UIImage或者NSString或者NSData）
 */
@property (nonatomic,strong) NSObject *iconObject;

/**
 占位符
 */
@property (nonatomic,  copy) NSString *placeholder;

/**
 CELL的配置MODEL
 */
@property (nonatomic,strong) ZFJFormCellConfig *configModel;

/**
 CELL的初始高度
 */
@property (nonatomic,assign) CGFloat height;

/**
 输入框值发生改变回调
 */
@property (nonatomic,  copy) ZFJValueDidChangedBlock valueDidChangedBlock;

/**
 验证Block
 */
@property (nonatomic,  copy) ZFJValidateBlock validateBlock;

/**
 自定义CELL事件处理
 */
@property (nonatomic,  copy) ZFJCustomEventBlock customCellEventBlock;

/**
 自定义CELL的类型（注册自定义CELL）
 */
@property (nonatomic,  copy) Class customCls;

/**
 CELL是否可以点击
 */
@property (nonatomic,assign) BOOL isCanSelect;

/**
 键盘类型
 */
@property (nonatomic,assign) UIKeyboardType keyboardType;

/**
 textView最大高度
 */
@property (nonatomic,assign) CGFloat textView_maxHeight;

/**
 TextField和TextView最大长度
 */
@property (nonatomic,assign) CGFloat inut_maxCount;

/**
 是否显示向右小图标（默认不显示，如果cellRightImg！= nil 就一定会显示，isShowCellRightImg = YES）
 */
@property (nonatomic,assign) BOOL isShowCellRightImg;

/**
 CELL向右小图标（如果设置了就一定会显示，isShowCellRightImg = YES）
 */
@property (nonatomic,  copy) UIImage *cellRightImg;

@end

NS_ASSUME_NONNULL_END
