//
//  ZFJPlacehoderTextView.m
//  ZFJPlacehoderTextView
//
//  Created by ZFJ on 2018/6/25.
//  Copyright © 2018年 ZFJ. All rights reserved.
//

#import "ZFJPlacehoderTextView.h"

static NSString * const kTextKey = @"text";

@interface ZFJPlacehoderTextView ()

@property (nonatomic, strong) UITextView *placeholderView;

@end

@implementation ZFJPlacehoderTextView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpPlaceholderView];
    }
    
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpPlaceholderView];
    }
    
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:kTextKey];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _placeholderView.frame = self.bounds;
}


#pragma mark - observation

- (void)setUpPlaceholderView{
    _placeholderColor = [UIColor colorWithRed:0.776 green:0.776 blue:0.800 alpha:1.00];
    _placeholderView = [[UITextView alloc]init];
    _placeholderView.editable = NO;
    _placeholderView.scrollEnabled = NO;
    _placeholderView.showsHorizontalScrollIndicator = NO;
    _placeholderView.showsVerticalScrollIndicator = NO;
    _placeholderView.userInteractionEnabled = NO;
    _placeholderView.font = self.font;
    _placeholderView.contentInset = self.contentInset;
    _placeholderView.contentOffset = self.contentOffset;
    _placeholderView.textContainerInset = self.textContainerInset;
    _placeholderView.textColor = _placeholderColor;
    _placeholderView.backgroundColor = [UIColor clearColor];
    [self addSubview:_placeholderView];
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    [self addObserver:self forKeyPath:kTextKey options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:kTextKey]) {
        _placeholderView.hidden = [self hasText];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)textDidChange:(NSNotification *)notification{
    _placeholderView.hidden = [self hasText];
}

#pragma mark - setter
- (void)setFont:(UIFont *)font{
    [super setFont:font];
    _placeholderView.font = font;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    _placeholderView.textColor = _placeholderColor;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    [super setTextAlignment:textAlignment];
    _placeholderView.textAlignment = textAlignment;
}

- (void)setContentInset:(UIEdgeInsets)contentInset{
    [super setContentInset:contentInset];
    _placeholderView.contentInset = contentInset;
}

- (void)setContentOffset:(CGPoint)contentOffset{
    [super setContentOffset:contentOffset];
    _placeholderView.contentOffset = contentOffset;
}

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset{
    [super setTextContainerInset:textContainerInset];
    _placeholderView.textContainerInset = textContainerInset;
}

#pragma mark - placeholder
- (void)setPlaceholder:(NSString *)placeholder{
    _placeholderView.text = placeholder;
}

- (NSString *)placeholder{
    return _placeholderView.text;
}

@end
