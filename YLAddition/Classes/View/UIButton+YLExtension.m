//
//  UIButton+YLExtension.m
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import "UIButton+YLExtension.h"

@implementation UIButton (YLExtension)

+ (UIButton *)buttonWithType:(NSUInteger)type
                       frame:(CGRect)frame
                 normalImage:(UIImage *)bgImage
               selectedImage:(UIImage *)highlightedImage
                      target:(id)target action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [btn setBackgroundImage:highlightedImage forState:UIControlStateSelected];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}




+ (UIButton *)buttonWithType:(NSUInteger)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                      cImage:(UIImage *)cImage
                     bgImage:(UIImage *)bgImage
                 tappedImage:(UIImage *)tappedImage
                      target:(id)target
                      action:(SEL)selector
{
    
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:cImage forState:UIControlStateNormal];
    [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [btn setImage:tappedImage forState:UIControlStateSelected];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton *)buttonWithType:(NSUInteger)type
                       title:(NSString *)title
                       frame:(CGRect)frame
                      cImage:(UIImage *)cImage
                     bgImage:(UIImage *)bgImage
            highlightedImage:(UIImage *)highlightedImage
                      target:(id)target
                      action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:cImage forState:UIControlStateNormal];
    [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                        image:(UIImage *)image
                   titleColor:(UIColor *)aColor
                       target:(id)target
                       action:(SEL)selector;
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn setTitleColor:aColor forState:UIControlStateNormal];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector
{
    return [self buttonWithFrame:frame title:nil image:image titleColor:nil target:target action:selector];
}


+ (UIButton *)buttonWithFrame:(CGRect)frame
                        bgImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector
{
    return [self buttonWithFrame:frame title:nil bgImage:image titleColor:nil target:target action:selector];
}


+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                      bgImage:(UIImage *)bgImage
                   titleColor:(UIColor *)aColor
                       target:(id)target
                       action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
    if (aColor) {
        [btn setTitleColor:aColor forState:UIControlStateNormal];
    }
    if (target) {
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
    
}



- (void)setImagePosition:(YLFImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case YLFImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case YLFImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case YLFImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case YLFImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }

}


@end
