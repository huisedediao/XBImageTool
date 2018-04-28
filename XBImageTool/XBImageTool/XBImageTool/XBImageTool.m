//
//  XBImageTool.m
//  XBImageTool
//
//  Created by xxb on 2018/4/28.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBImageTool.h"

@implementation XBImageTool

/**
 *  普通图片转位灰白图片
 *
 *  @param image 普通图片
 *
 *  @return 灰白图片
 */
- (UIImage *)grayImage:(UIImage *)image
{
    int width  = image.size.width;
    int height = image.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate(nil,
                                                 width,
                                                 height,
                                                 8, // bits per component
                                                 0,
                                                 colorSpace,
                                                 kCGBitmapByteOrderDefault);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        
        return nil;
    }
    
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), image.CGImage);
    CGImageRef imageRef   = CGBitmapContextCreateImage(context);
    UIImage *grayImage = [UIImage imageWithCGImage:imageRef];
    CFRelease(imageRef);
    CGContextRelease(context);
    
    return grayImage;
}

@end
