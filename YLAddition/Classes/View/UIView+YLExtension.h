//
//  UIView+YLExtension.h
//  HongBi
//
//  Created by DingDing on 2019/12/25.
//  Copyright © 2019 liangyl. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLExtension)

- (void)addTapGes:(void (^)(id sender))tapCallback;

@end

NS_ASSUME_NONNULL_END
