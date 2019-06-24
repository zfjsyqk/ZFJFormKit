//
//  ZFJFormTableView.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormTableView.h"
#import "ZFJFormCell.h"
#import "ZFJFormLabelCell.h"
#import "ZFJFormHeadImgCell.h"
#import "ZFJFormTextFieldCell.h"
#import "ZFJFormTextViewCell.h"
#import "ZFJFormSwitchwCell.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"
#import "ZFJFormConfig.h"

@interface ZFJFormTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,assign) NSInteger sectionsCount;

@property (nonatomic,retain) ZFJFormConfig *formConfig;

@end

@implementation ZFJFormTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style config:(ZFJFormConfig *)config{
    self = [super initWithFrame:frame style:style];
    if (self){
        _formConfig = config;
        [self initData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame config:(ZFJFormConfig *)config{
    self = [super initWithFrame:frame];
    if (self){
        _formConfig = config;
        [self initData];
    }
    return self;
}

- (instancetype)initWithConfig:(ZFJFormConfig *)config{
    self = [super init];
    if (self){
        _formConfig = config;
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder config:(ZFJFormConfig *)config{
    self = [super initWithCoder:coder];
    if (self) {
        _formConfig = config;
        [self initData];
    }
    return self;
}

- (void)initData{
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = _formConfig.backgroundColor ? _formConfig.backgroundColor :  [UIColor groupTableViewBackgroundColor];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsVerticalScrollIndicator = NO;
    
    [self registerClass:[ZFJFormCell class] forCellReuseIdentifier:NSStringFromClass([ZFJFormCell class])];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionsCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_sectionsCount == 1){
    return self.dataArray.count;
    }else if (_sectionsCount > 1){
        NSArray *dataArray = (NSArray *)[self.sectionsDataArray objectAtIndex:section];
        return dataArray.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFJFormModel *model = nil;
    if(_sectionsCount == 1){
        model = [self.dataArray objectAtIndex:indexPath.row];
    }else{
        model = [[self.sectionsDataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    Class cls = [self getCellClassWithModel:model];
    ZFJFormCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
    if (!cell){
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFJFormCell class])];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    if ([cell conformsToProtocol:@protocol(ZFJFormCellDelegate)]){
        [cell configCellWithModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFJFormModel *model = nil;
    if(_sectionsCount == 1){
        model = [self.dataArray objectAtIndex:indexPath.row];
    }else{
        model = [[self.sectionsDataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    return (model.height > 0) ? model.height : 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _formConfig.heightHeader > 0 ? _formConfig.heightHeader : 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return _formConfig.heightFooter > 0 ? _formConfig.heightFooter : 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = _formConfig.headerViewBgColor;
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = _formConfig.footerViewBgColor;
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZFJFormModel *model = nil;
    if(_sectionsCount == 1){
        model = [self.dataArray objectAtIndex:indexPath.row];
    }else{
        model = [[self.sectionsDataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    if(model.isCanSelect && self.didSelectRowBlock){
        self.didSelectRowBlock(indexPath, model);
    }
}

- (void)registerClassWithDataArray:(NSArray<ZFJFormModel *> *)dataArray{
    NSMutableSet *set = [NSMutableSet set];
    for (ZFJFormModel *model in self.dataArray){
        Class cls = [self getCellClassWithModel:model];
        [set addObject:cls];
    }
    for (Class cls in set){
        [self registerClass:cls forCellReuseIdentifier:NSStringFromClass(cls)];
    }
}

- (Class)getCellClassWithModel:(ZFJFormModel *)model{
    if(model.formCellType == KFormCellLabelType){
        return [ZFJFormLabelCell class];
    }else if(model.formCellType == KFormCellHeadImgType){
        return [ZFJFormHeadImgCell class];
    }else if(model.formCellType == KFormCellLabelType){
        return [ZFJFormCell class];
    }else if(model.formCellType == KFormCellTextFieldType){
        return [ZFJFormTextFieldCell class];
    }else if(model.formCellType == KFormCellTextViewType){
        return [ZFJFormTextViewCell class];
    }else if(model.formCellType == KFormCellSwitchType){
        return [ZFJFormSwitchwCell class];
    }else if(model.formCellType == KFormCellCustomType){
        return model.customCls;
    }
    return [UITableViewCell class];
}

- (void)setDataArray:(NSArray<ZFJFormModel *> *)dataArray{
    _dataArray = dataArray;
    _sectionsCount = 1;
    [self registerClassWithDataArray:dataArray];
    [self reloadData];
}

- (void)setSectionsDataArray:(NSArray<NSArray *> *)sectionsDataArray{
    _sectionsDataArray = sectionsDataArray;
    _sectionsCount = sectionsDataArray.count;
    for (NSArray<ZFJFormModel *> *dataArray in sectionsDataArray) {
        [self registerClassWithDataArray:dataArray];
    }
    [self reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
