//
//  UIImage+YLExtension.h
//  TestToolsAndCategroys
//
//  Created by MobbyDeveloper on 15/11/25.
//  Copyright © 2015年 LYL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YLExtension)

+ (UIImage *)imageFromUIView:(UIView *)aView;

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;

+ (NSMutableArray *)fileArrayrFromReadLoadSource:(NSString *)resourcePath;

//从沙盒中读取图片
+ (UIImage *)getLoadImage:(NSString *)imageName;


+ (UIImage *)getPNGImage:(NSString *)imageName;

//返回一个绽放到newSize可以放下的image
+ (UIImage *)scaledCopyOfSize:(CGSize)newSize image:(UIImage *)image;

//从上到下拼出图片，在最后加上水印
+ (UIImage *) mergeImagesData:(NSArray *)imagesDatas logo:(UIImage *)logo;

- (CGRect)convertCropRect:(CGRect)cropRect;
- (UIImage *)croppedImage:(CGRect)cropRect;
- (UIImage *)resizedImage:(CGSize)size imageOrientation:(UIImageOrientation)imageOrientation;

//创建缩略图，边长，透明边距，圆角，图片质量
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage*)rotate:(UIImageOrientation)orient;

- (UIImage*)resizeImageWithNewSize:(CGSize)newSize;




@end


@interface UIImage (Alpha)

- (BOOL)hasAlpha;

- (UIImage *)imageWithAlpha;
//添加一个透明的边框
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
//给图片添加阴影
-(UIImage *)imageWithShadow:(UIColor*)_shadowColor
                 shadowSize:(CGSize)_shadowSize
                       blur:(CGFloat)_blur;
//将非透明区域填充上color
- (UIImage *)maskWithColor:(UIColor *)color;

- (UIImage *)maskWithColor:(UIColor *)color
               shadowColor:(UIColor *)shadowColor
              shadowOffset:(CGSize)shadowOffset
                shadowBlur:(CGFloat)shadowBlur;

@end



@interface UIImage(fixOrientation)
//去除拍照得来的image的Orientation属性，防止其他平台图片出现翻转
- (UIImage *)fixOrientation;

@end



@interface UIImage (RoundedCorner)
//添加圆角及边框
- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

//截取一个区域并添加上圆角
- (UIImage*)imageWithRadius:(float) radius
                      width:(float)width
                     height:(float)height;

@end


@interface UIImage (CS_Extensions)

- (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

//- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
//- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
//等比缩放
- (UIImage *)imageFitInSize:(CGSize)viewsize;

@end;


@interface UIImage (sizeFit)
//thisSize 等比缩放到 aSize的 size
+ (CGSize)fitSize:(CGSize)thisSize inSize:(CGSize)aSize;
//等比缩放到指定size,如果有额外区域,显示透明
+ (UIImage *)image:(UIImage *)image fitInSize:(CGSize)viewsize;
//从image中心开始扩散截取viewsize的区域
+ (UIImage *)image:(UIImage *)image centerInSize:(CGSize)viewsize;
//整个填充viewsize,可能原图的某个边.
+ (UIImage *)image:(UIImage *)image fillSize:(CGSize)viewsize;
//截取成正方形
+ (UIImage *)autoFitImage:(UIImage *)image;
//截取成612正方形
+ (UIImage *)autoFitFormatImage:(UIImage *)image;
//
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end

@interface UIImage (YLCompress)

#pragma mark - 压缩图片
- (NSData *)compressOriginalImagetoMaxDataSizeKBytes:(CGFloat)size;

@end
