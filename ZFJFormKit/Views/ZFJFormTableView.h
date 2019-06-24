//
//  ZFJFormTableView.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZFJFormModel, ZFJFormConfig;

typedef void(^ZFJTableViewDidSelectRowBlock)(NSIndexPath * _Nullable indexPath, ZFJFormModel * _Nullable model);

NS_ASSUME_NONNULL_BEGIN

@interface ZFJFormTableView : UITableView

- (instancetype)initWithConfig:(ZFJFormConfig *)config;

- (instancetype)initWithCoder:(NSCoder *)coder config:(ZFJFormConfig *)config;

- (instancetype)initWithFrame:(CGRect)frame config:(ZFJFormConfig *)config;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style config:(ZFJFormConfig *)config;

/**
 数据源数组(Sections = 1)
 */
@property (nonatomic,strong) NSArray<ZFJFormModel *> *dataArray;

/**
 数据源数组(Sections > 1)
 */
@property (nonatomic,strong) NSArray<NSArray *> *sectionsDataArray;

/**
 CELL被点击了（只有CELL）
 */
@property (nonatomic, copy) ZFJTableViewDidSelectRowBlock didSelectRowBlock;

#pragma mark ----------NS_UNAVAILABLE----------

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
