//
//  NSData+YLExtension.m
//  HongBi
//
//  Created by liangyl on 2020/2/23.
//  Copyright © 2020 liangyl. All rights reserved.
//

#import "NSData+YLExtension.h"


@implementation NSData (YLExtension)

#pragma mark - 压缩图片
- (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size
{
    UIImage *OriginalImage = image;
    
    // 执行这句代码之后会有一个范围 例如500m 会是 100m～500k
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    
    // 执行while循环 如果第一次压缩不会小雨100k 那么减小尺寸在重新开始压缩
    while (dataKBytes > size)
    {
        while (dataKBytes > size && maxQuality > 0.1f)
        {
            maxQuality = maxQuality - 0.1f;
            data = UIImageJPEGRepresentation(image, maxQuality);
            dataKBytes = data.length / 1000.0;
            if(dataKBytes <= size )
            {
                return data;
            }
        }
        OriginalImage =[self compressOriginalImage:OriginalImage toWidth:OriginalImage.size.width * 0.8];
        image = OriginalImage;
        data = UIImageJPEGRepresentation(image, 1.0);
        dataKBytes = data.length / 1000.0;
        maxQuality = 0.9f;
    }
    return data;
}

#pragma mark - 改变图片的大小
-(UIImage *)compressOriginalImage:(UIImage *)image toWidth:(CGFloat)targetWidth
{
    CGSize imageSize = image.size;
    CGFloat Originalwidth = imageSize.width;
    CGFloat Originalheight = imageSize.height;
    CGFloat targetHeight = Originalheight / Originalwidth * targetWidth;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [image drawInRect:CGRectMake(0,0,targetWidth,  targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
