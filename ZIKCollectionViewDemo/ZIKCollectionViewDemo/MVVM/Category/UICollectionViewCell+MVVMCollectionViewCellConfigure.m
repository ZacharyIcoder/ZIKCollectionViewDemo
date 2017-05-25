//
//  UICollectionViewCell+MVVMCollectionViewCellConfigure.m
//  Mobileyx
//
//  Created by ZIKong on 2017/4/7.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "UICollectionViewCell+MVVMCollectionViewCellConfigure.h"

@implementation UICollectionViewCell (MVVMCollectionViewCellConfigure)
#pragma mark --
+ (UINib *)nibWithIdentifier:(NSString *)identifier
{
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - Public
+ (void)mvvm_registerCollect:(UICollectionView *)collect
              nibIdentifier:(NSString *)identifier
{
    [collect registerNib:[self nibWithIdentifier:identifier] forCellWithReuseIdentifier:identifier];
}

+ (void)mvvm_registerCollect:(UICollectionView *)collect classIdentifier:(NSString *)identifier {
    [collect registerClass:[self class] forCellWithReuseIdentifier:identifier];
}

#pragma mark --
#pragma mark - Rewrite these func in SubClass !
- (void)mvvm_configure:(UICollectionViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass !
}

- (void)mvvm_configure:(UICollectionViewCell *)cell viewModel:(id)viewModel indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass !
}

+ (CGFloat)mvvm_getCellHeightWithModel:(id)model indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass if necessary
    if (!model) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}

@end
