//
//  UIButton+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, YLFImagePosition) {
    YLFImagePositionLeft = 0, //图片在左，文字在右，默认
    YLFImagePositionRight,    //图片在右，文字在左
    YLFImagePositionTop,      //图片在上，文字在下
    YLFImagePositionBottom,   //图片在下，文字在上
};


@interface UIButton (YLExtension)

+ (UIButton *)buttonWithType:(NSUInteger)type
                       frame:(CGRect)frame
                 normalImage:(UIImage *)bgImage
               selectedImage:(UIImage *)highlightedImage
                      target:(id)target action:(SEL)selector;

+ (UIButton *)buttonWithType:(NSUInteger)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                      cImage:(UIImage *)cImage
                     bgImage:(UIImage *)bgImage
                 tappedImage:(UIImage *)tappedImage
                      target:(id)target
                      action:(SEL)selector;

+ (UIButton *)buttonWithType:(NSUInteger)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                      cImage:(UIImage *)cImage
                     bgImage:(UIImage *)bgImage
            highlightedImage:(UIImage *)highlightedImage
                      target:(id)target
                      action:(SEL)selector;


+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                      bgImage:(UIImage *)bgImage
                   titleColor:(UIColor *)aColor
                       target:(id)target
                       action:(SEL)selector;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                   titleColor:(UIColor *)aColor
                       target:(id)target
                       action:(SEL)selector;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector;

+ (UIButton *)buttonWithFrame:(CGRect)frame
                      bgImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector;


- (void)setImagePosition:(YLFImagePosition)postion spacing:(CGFloat)spacing;


@end
