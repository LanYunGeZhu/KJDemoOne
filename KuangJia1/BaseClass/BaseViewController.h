//
//  BaseViewController.h
//  KuangJia1
//
//  Created by MrSong on 17/7/21.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


//自定义左侧按钮
- (void)setLeftTxt:(NSString *)title action:(SEL)action;
- (void)setLeftImg:(UIImage *)img action:(SEL)action;
//自定义右侧按钮
- (void)setRightTxt:(NSString *)title action:(SEL)action;
- (void)setRightImg:(UIImage *)img action:(SEL)action;



@end
