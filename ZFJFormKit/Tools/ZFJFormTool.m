//
//  ZFJFormTool.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormTool.h"
#import "ZFJFormModel.h"

@implementation ZFJFormTool

+ (CGRect)dynamicHeight:(NSString *)str width:(CGFloat)width height:(CGFloat)height font:(UIFont *)font{
    if(str == nil || [str isEqual:[NSNull null]]){
        str = @"";
    }
    NSMutableParagraphStyle*style = [[NSMutableParagraphStyle alloc]init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    NSDictionary*dict = @{NSFontAttributeName:font,NSParagraphStyleAttributeName:style};
    NSStringDrawingOptions opts = NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading;
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, height) options:opts attributes:dict context:nil];
    return rect;
}

+ (BOOL)validateDataArray:(NSArray<ZFJFormModel *> *)dataArray{
    for (ZFJFormModel * _Nonnull model in dataArray){
        if (model.validateBlock){
            if (!model.validateBlock(model)) return NO;
        }
    }
    return YES;
}

+ (BOOL)validateSectionsDataArray:(NSArray<NSArray *> *)sectionsDataArray{
    for (NSArray<ZFJFormModel *> *dataArray in sectionsDataArray) {
        BOOL isScu = [ZFJFormTool validateDataArray:dataArray];
        if(!isScu){
            return NO;//失败
        }
    }
    return YES;
}

@end
