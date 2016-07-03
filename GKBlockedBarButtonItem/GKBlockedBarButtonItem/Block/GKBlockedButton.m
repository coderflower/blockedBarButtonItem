//
//  GKBlockedButton.m
//  爱鲜蜂
//
//  Created by 花菜ChrisCai on 2016/7/3.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "GKBlockedButton.h"

@implementation GKBlockedButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self setup];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}

- (void)setup {
    [self addTarget:self action:@selector(tapped) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)tapped {
    if (_tapHandler) {
        _tapHandler();
    }
}

+ (instancetype)blockedButtonWithTapHandler:(void(^)())tapHandler {
    return [self blockedButtonWithTapHandler:tapHandler frame:CGRectNull addToSuperview:nil];
}

+ (instancetype)blockedButtonWithTapHandler:(void(^)())tapHandler frame:(CGRect)frame {
    return [self blockedButtonWithTapHandler:tapHandler frame:frame addToSuperview:nil];
}

+ (instancetype)blockedButtonWithTapHandler:(void(^)())tapHandler frame:(CGRect)frame addToSuperview:(UIView *)superview {
    GKBlockedButton *button = [GKBlockedButton new];
    button.tapHandler = tapHandler;
    
    if (!CGRectIsNull(frame)) {
        button.frame = frame;
    }
    
    if (superview) {
        [superview addSubview:button];
    }
    
    return button;
}

@end
