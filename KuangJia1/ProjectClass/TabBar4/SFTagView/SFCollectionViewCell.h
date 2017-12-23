//
//  SFCollectionViewCell.h
//  KuangJia1
//
//  Created by MrSong on 17/8/3.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) NSString *content;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

+ (CGSize) getSizeWithContent:(NSString *) content maxWidth:(CGFloat)maxWidth customHeight:(CGFloat)cellHeight;

@end
