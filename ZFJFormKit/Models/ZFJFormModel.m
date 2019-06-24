//
//  ZFJFormModel.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormModel.h"

@implementation ZFJFormModel

- (void)setCellRightImg:(UIImage *)cellRightImg{
    _cellRightImg = cellRightImg;
    _isShowCellRightImg = _cellRightImg != nil ? YES : NO;
}

@end
