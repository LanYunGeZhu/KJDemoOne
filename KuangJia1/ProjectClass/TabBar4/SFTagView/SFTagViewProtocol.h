
//
//  SFTagViewProtocol.h
//  KuangJia1
//
//  Created by MrSong on 17/8/3.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFTagView;

@protocol SFTagViewDataSource <NSObject>

@required
- (NSInteger)numOfItems;

- (NSString *)tagView:(SFTagView *)tagView titleForItemAtIndex:(NSInteger)index;

@end

@protocol SFTagViewDelegate <NSObject>

@optional

- (void)tagView:(SFTagView *)tagView didSelectedItemAtIndex:(NSInteger)index;

/**
 使用frame布局实现一下代理方法获得填充数据后的正确的高度(高度已内部调整)
 
 @param tagView tagView
 @param height 高度
 */
- (void)tagView:(SFTagView *)tagView heightUpdated:(CGFloat)height;

@end
