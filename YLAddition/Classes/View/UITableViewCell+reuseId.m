//
//  UITableViewCell+reuseId.m
//  HongBi
//
//  Created by DingDing on 2020/1/9.
//  Copyright © 2020 liangyl. All rights reserved.
//

#import "UITableViewCell+reuseId.h"
@implementation UITableViewCell (reuseId)

+ (NSString *)reuseID {
    return NSStringFromClass(self);
}

@end
