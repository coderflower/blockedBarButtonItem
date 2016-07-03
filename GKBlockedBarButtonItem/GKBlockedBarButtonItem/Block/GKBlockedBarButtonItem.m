//
//  GKBlockedBarButtonItem.m
//  爱鲜蜂
//
//  Created by 花菜ChrisCai on 2016/7/2.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "GKBlockedBarButtonItem.h"

@interface GKBlockedBarButtonItem ()
@property (nonatomic, copy) void(^eventHandler)();
@property (nonatomic, strong) UITapGestureRecognizer *customViewTapGestureRecognizer;
@end
@implementation GKBlockedBarButtonItem

- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self setup];
    
    return self;
}

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem {
    self = [super initWithBarButtonSystemItem:systemItem target:nil action:nil];
    
    [self setup];
    
    return self;
}


- (instancetype)initWithImage:(UIImage *)image {
    self = [super initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self setup];
    
    return self;
}

- (void)setup {
    self.target = self;
    self.action = @selector(tapped);
}

- (instancetype)initWithCustomView:(UIView *)customView eventHandler:(void(^)())eventHandler {
    self = [super initWithCustomView:customView];
    
    if (eventHandler) {
        self.customViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(customViewTapGestureRecognizer:)];
        [customView addGestureRecognizer:self.customViewTapGestureRecognizer];
    }
    self.eventHandler = eventHandler;
    
    return self;
}

- (void)tapped {
    if (self.eventHandler) {
        self.eventHandler();
    }
}

- (void)customViewTapGestureRecognizer:(UITapGestureRecognizer *)gr {
    [self tapped];
}

+ (instancetype)blockedBarButtonItemWithTitle:(NSString *)title eventHandler:(void (^)())eventHandler {
    GKBlockedBarButtonItem *tmp = [[GKBlockedBarButtonItem alloc] initWithTitle:title];
    tmp.eventHandler = eventHandler;
    
    return tmp;
}

+ (instancetype)blockedBarButtonItemWithImage:(UIImage *)image eventHandler:(void (^)())eventHandler {
    GKBlockedBarButtonItem *tmp = [[GKBlockedBarButtonItem alloc] initWithImage:image];
    tmp.eventHandler = eventHandler;
    
    return tmp;
}

+ (instancetype)blockedBarButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem eventHandler:(void (^)())eventHandler {
    GKBlockedBarButtonItem *tmp = [[GKBlockedBarButtonItem alloc] initWithBarButtonSystemItem:systemItem];
    tmp.eventHandler = eventHandler;
    
    return tmp;
}

+ (instancetype)blockedBarButtonItemWithCustomView:(UIView *)customView {
    return [[self class] blockedBarButtonItemWithCustomView:customView eventHandler:nil];
}

+ (instancetype)blockedBarButtonItemWithCustomView:(UIView *)customView eventHandler:(void (^)())eventHandler {
    GKBlockedBarButtonItem *item = [[GKBlockedBarButtonItem alloc] initWithCustomView:customView eventHandler:eventHandler];
    
    return item;
}

- (void)dealloc {
    if (self.customView && _customViewTapGestureRecognizer) {
        [self.customView removeGestureRecognizer:_customViewTapGestureRecognizer];
    }
}
@end
