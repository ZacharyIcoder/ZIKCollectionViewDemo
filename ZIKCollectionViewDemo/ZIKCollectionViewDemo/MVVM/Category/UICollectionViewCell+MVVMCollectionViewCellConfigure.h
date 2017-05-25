//
//  UICollectionViewCell+MVVMCollectionViewCellConfigure.h
//  Mobileyx
//
//  Created by ZIKong on 2017/4/7.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (MVVMCollectionViewCellConfigure)
/**
 *  从nib文件中根据重用标识符注册UICollectionViewcell
 */
+ (void)mvvm_registerCollect:(UICollectionView *)collect
              nibIdentifier:(NSString *)identifier;

/**
 *  从class根据重用标识符注册UICollectionViewcell
 */
+ (void)mvvm_registerCollect:(UICollectionView *)collect
             classIdentifier:(NSString *)identifier;

/**
 *  根据model配置UICollectionViewcell，设置UICollectionViewcell内容
 */
- (void)mvvm_configure:(UICollectionViewCell *)cell
                 model:(id)model
             indexPath:(NSIndexPath *)indexPath;

/**
 *  根据viewModel配置UICollectionViewcell，设置UICollectionViewcell内容
 */
- (void)mvvm_configure:(UICollectionViewCell *)cell
             viewModel:(id)viewModel
             indexPath:(NSIndexPath *)indexPath;

/**
 *  获取自定义对象的cell高度
 */
+ (CGFloat)mvvm_getCellHeightWithModel:(id)model
                             indexPath:(NSIndexPath *)indexPath;

@end
