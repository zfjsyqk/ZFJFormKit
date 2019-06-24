//
//  ZFJFormHeadImgCell.m
//  ZFJFormKit
//
//  Created by 张福杰 on 2018/4/22.
//  Copyright © 2019 张福杰. All rights reserved.
//

#import "ZFJFormHeadImgCell.h"
#import "NSData+ZFJDataCache.h"
#import "ZFJFormModel.h"
#import "ZFJFormCommon.h"

@interface ZFJFormHeadImgCell ()

@property (nonatomic,strong) UIImageView *headImgView;

@end

@implementation ZFJFormHeadImgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)uiConfig{
    [super uiConfig];
    [self.contentView addSubview:self.headImgView];
}

- (void)configCellWithModel:(ZFJFormModel *)model{
    [super configCellWithModel:model];
    if(self.model.isShowCellRightImg){
        self.headImgView.frame = CGRectMake(ZFJForm_ScreenWidth - (self.model.height - self.model.configModel.marginSize * 2) - self.model.configModel.marginSize - KLeftImgViewSize - 8, self.model.configModel.marginSize, self.model.height - self.model.configModel.marginSize * 2, self.model.height - self.model.configModel.marginSize * 2);
    }else{
        self.headImgView.frame = CGRectMake(ZFJForm_ScreenWidth - (self.model.height - self.model.configModel.marginSize * 2) - self.model.configModel.marginSize, self.model.configModel.marginSize, self.model.height - self.model.configModel.marginSize * 2, self.model.height - self.model.configModel.marginSize * 2);
    }
    
    if(self.model.iconObject){
        if([self.model.iconObject isKindOfClass:[NSString class]]){
            [self loadImageWithUrlStr:(NSString *)self.model.iconObject];
        }else if ([self.model.iconObject isKindOfClass:[UIImage class]]){
            self.headImgView.image = (UIImage *)self.model.iconObject;
        }else if ([self.model.iconObject isKindOfClass:[NSData class]]){
            self.headImgView.image = [UIImage imageWithData:(NSData *)self.model.iconObject];
        }
    }
    if(self.model.configModel.headImgRadius > 0){
        self.headImgView.layer.cornerRadius = self.model.configModel.headImgRadius;
        self.headImgView.layer.masksToBounds = YES;
    }else if(self.model.configModel.headImgRadius == -1){
        self.headImgView.layer.cornerRadius = self.headImgView.frame.size.width/2;
        self.headImgView.layer.masksToBounds = YES;
    }
}

- (void)loadImageWithUrlStr:(NSString *)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *data = [NSData getDataCacheWithIdentifier:urlStr];
    if(data){
        self.headImgView.image = [UIImage imageWithData:data];
    }else{
        NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                UIImage *image = [UIImage imageWithData:data];
                if (!image) return;
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.headImgView.image = image;
                });
                self.model.iconObject = image;
                [data saveDataCacheWithIdentifier:url.absoluteString];
            }else {
                static int repeat = 0;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (repeat > 10) return;
                    [self loadImageWithUrlStr:urlStr];
                    repeat ++;
                });
            }
        }];
        [dataTask resume];
    }
}

- (UIImageView *)headImgView{
    if(_headImgView == nil){
        _headImgView = [[UIImageView alloc] init];
        _headImgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _headImgView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
