//
//  UIScrollView+JRFRefresh.m
//  joyRunner
//
//  Created by AlanWang on 16/11/15.
//  Copyright © 2016年 Joyrun. All rights reserved.
//

#import "UIScrollView+JRRefresh.h"
#import "JRRefreshHeader.h"
#import "JRRefreshCircleView.h"
#import "JRRefreshFooter.h"
#import <objc/runtime.h>

#define RefreshFooterViewDefaultHeight  65.0


static NSString *kJr_headerKey = @"kJr_headerKey";
static NSString *kJr_footerKey = @"kJr_footerKey";

@implementation UIScrollView (JRRefresh)


- (void)setJr_header:(JRRefreshHeader *)jr_header {
    
    if (jr_header != self.jr_header) {
        
        [self.jr_header removeFromSuperview];
        [self insertSubview:jr_header atIndex:0];
        objc_setAssociatedObject(self, &kJr_headerKey, jr_header, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
}
- (JRRefreshHeader *)jr_header {
    return objc_getAssociatedObject(self, &kJr_headerKey);
}

- (void)setJr_footer:(UIView *)jr_footer {
    if (jr_footer != self.jr_footer) {
        [self.jr_footer removeFromSuperview];
        [self insertSubview:jr_footer atIndex:0];
        objc_setAssociatedObject(self, &kJr_footerKey, jr_footer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (self.jr_footer.jr_height <= 0   ) {
            self.jr_footer.jr_height = RefreshFooterViewDefaultHeight;
        }
        self.jr_footer.frame = CGRectMake(0, self.contentSize.height, self.jr_width, self.jr_footer.jr_height);
        self.jr_footer.backgroundColor = [UIColor whiteColor];
    }
}
- (UIView *)jr_footer {
    return objc_getAssociatedObject(self, &kJr_footerKey);
}


- (void)jr_stopLoading {
    [self.jr_header.indicatorView stopLoadingAnimation];
    [self.jr_footer stopLoading];
}

- (void)jr_starRefresh {
    [self.jr_header.indicatorView startLoadingAnimation];
}

- (void)jr_starLoadMore {
    
}

- (void)jr_reloadd {
    [self jr_reloadd];
    
    
}

+ (void)load {
    Method m1 = class_getInstanceMethod(self, reload);
    
    method_exchangeImplementations(<#Method m1#>, <#Method m2#>)
}
@end
