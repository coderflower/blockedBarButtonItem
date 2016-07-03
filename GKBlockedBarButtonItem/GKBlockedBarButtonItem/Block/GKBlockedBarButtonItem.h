//
//  GKBlockedBarButtonItem.h
//  爱鲜蜂
//
//  Created by 花菜ChrisCai on 2016/7/2.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKBlockedBarButtonItem : UIBarButtonItem


/**
 *  快速创建带标题和点击回调的UIBarButtonItem
 *
 *  @param title        名称
 *  @param eventHandler 点击事件回调Block
 *
 */
+ (instancetype)blockedBarButtonItemWithTitle:(NSString *)title eventHandler:(void(^)())eventHandler;
/**
 *  快速创建带图片和点击回调的UIBarButtonItem
 *
 *  @param image        图片
 *  @param eventHandler 点击回调事件
 *
 */
+ (instancetype)blockedBarButtonItemWithImage:(UIImage *)image eventHandler:(void (^)())eventHandler;
+ (instancetype)blockedBarButtonItemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem eventHandler:(void (^)())eventHandler;
+ (instancetype)blockedBarButtonItemWithCustomView:(UIView *)customView;
+ (instancetype)blockedBarButtonItemWithCustomView:(UIView *)customView eventHandler:(void (^)())eventHandler;
@end
