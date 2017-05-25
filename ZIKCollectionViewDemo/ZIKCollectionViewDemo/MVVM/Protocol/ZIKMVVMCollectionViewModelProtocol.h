//
//  ZIKMVVMCollectionViewModelProtocol.h
//  Mobileyx
//
//  Created by ZIKong on 2017/5/19.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZIKMVVMCollectionViewModelProtocol <NSObject>

@required

- (void)handleWithCollectionView:(UICollectionView *)collectionView;
- (void)getDataWithModelArray:(id (^)())modelArrayBlock completion:(void (^)())completion;

@end
