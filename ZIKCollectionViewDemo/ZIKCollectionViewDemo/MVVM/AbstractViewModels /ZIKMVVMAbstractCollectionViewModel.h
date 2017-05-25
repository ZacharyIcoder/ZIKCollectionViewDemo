//
//  ZIKMVVMAbstractCollectionViewModel.h
//  Mobileyx
//
//  Created by ZIKong on 2017/5/19.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//
//抽象出 CollectionViewModel 共同的共性，形成CollectionViemModel 的 抽象基类 （Abstract Base Class, ABC）

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ZIKMVVMCollectionViewModelProtocol.h"

/**
 *  选中UICollectionViewCell的Block
 */
typedef void (^DidSelectCellBlock) (NSIndexPath *indexPath, id item);

/**
 *  点击section头部的更多的的Block
 */
typedef void (^DidClickMoreButtonBlock) (NSIndexPath *indexPath, id item);


@interface ZIKMVVMAbstractCollectionViewModel : NSObject<ZIKMVVMCollectionViewModelProtocol>

@property (nonatomic, copy) DidSelectCellBlock      didSelectCellBlock;

@property (nonatomic, copy) DidClickMoreButtonBlock didClickMoreButtonBlock;

@end
