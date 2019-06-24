//
//  ZFJFormCellDelegate.h
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/24.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZFJFormModel;

@protocol ZFJFormCellDelegate <NSObject>

- (void)configCellWithModel:(ZFJFormModel *)model;

@end

