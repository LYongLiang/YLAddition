//
//  UITableView+YLExtension.m
//  HongBi
//
//  Created by liangyl on 2020/2/23.
//  Copyright © 2020 liangyl. All rights reserved.
//

#import "UITableView+YLExtension.h"


@implementation UITableView (YLExtension)

//默认为NO
- (void)fixiOS11Fit:(BOOL)adjust {
    if (@available(iOS 11.0, *)) {
        if (!adjust) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedRowHeight = 0;
    }
}

@end
