//
//  ZIKCollectionViewModel.m
//  ZIKCollectionViewDemo
//
//  Created by ZIKong on 2017/5/25.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "ZIKCollectionViewModel.h"
#import "UICollectionViewCell+MVVMCollectionViewCellConfigure.h"

#import "ZIKMoreCollectionReusableView.h"
#import "ZIKHotCollectionViewCell.h"
#import "ZIKNewCollectionViewCell.h"
#import "ZIKSoldCollectionViewCell.h"

//屏幕的宽高
#define UIScreenWidth                              [UIScreen mainScreen].bounds.size.width
#define UIScreenHeight                             [UIScreen mainScreen].bounds.size.height
#define kWeakSelf __weak typeof(self) weakSelf = self;

static NSString *const kArtDetailMoreHeadViewReuseView = @"ZIKMoreCollectionReusableView";

static NSString *const kZIKHotCell   = @"ZIKHotCollectionViewCell";
static NSString *const kZIKNewCell   = @"ZIKNewCollectionViewCell";
static NSString *const kZIKSoldCell  = @"ZIKSoldCollectionViewCell";

@interface ZIKCollectionViewModel ()
@property (nonatomic, strong) NSArray *artNewArray;
@property (nonatomic, strong) NSArray *artHotArray;
@property (nonatomic, strong) NSArray *artSoldArray;

@end
@implementation ZIKCollectionViewModel

- (void)handleWithCollectionView:(UICollectionView *)collectionView {
    collectionView.dataSource = self;
    collectionView.delegate   = self;
    UICollectionViewFlowLayout *martFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    martFlowLayout.minimumInteritemSpacing = 0;
    martFlowLayout.minimumLineSpacing      = 2;
    martFlowLayout.sectionInset            = UIEdgeInsetsMake(3, 0, 0, 0);
    martFlowLayout.scrollDirection         = UICollectionViewScrollDirectionVertical;
    [collectionView setCollectionViewLayout:martFlowLayout];
    // 注册cell
    [collectionView registerNib:[UINib nibWithNibName:kZIKHotCell bundle:nil] forCellWithReuseIdentifier:kZIKHotCell];
    [collectionView registerNib:[UINib nibWithNibName:kZIKNewCell bundle:nil] forCellWithReuseIdentifier:kZIKNewCell];
    [collectionView registerNib:[UINib nibWithNibName:kZIKSoldCell bundle:nil] forCellWithReuseIdentifier:kZIKSoldCell];
   //注册重用HeadView
    UINib *moreheaderNib = [UINib nibWithNibName: @"ZIKMoreCollectionReusableView"
                                          bundle: [NSBundle mainBundle]];
    [collectionView registerNib: moreheaderNib
     forSupplementaryViewOfKind: UICollectionElementKindSectionHeader
            withReuseIdentifier: kArtDetailMoreHeadViewReuseView];

}

-(void)getDataWithModelArray:(id (^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
        NSDictionary *infoDic  = modelArrayBlock();
        self.artHotArray       = infoDic[@"hotGoods"];
        self.artNewArray       = infoDic[@"newGoods"];
        self.artSoldArray      = infoDic[@"soldGoods"];
        
        if (completion) {
            completion();
        }
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.artHotArray.count;
    }
    else if (section == 1) {
        return self.artNewArray.count;
    }
    else if (section == 2) {
        return self.artSoldArray.count;
    }
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZIKHotCell forIndexPath:indexPath];
        if (self.artHotArray.count > 0) {
            [cell mvvm_configure:cell model:self.artHotArray[indexPath.row] indexPath:indexPath];
        }
        return cell ;
    }
    else if (indexPath.section == 1) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZIKNewCell forIndexPath:indexPath];
        if (self.artNewArray.count > 0) {
            [cell mvvm_configure:cell model:self.artNewArray[indexPath.row] indexPath:indexPath];
        }
        return cell;
    }
    else if (indexPath.section == 2) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kZIKSoldCell forIndexPath:indexPath];
        if (self.artSoldArray.count > 0) {
            [cell mvvm_configure:cell model:self.artSoldArray[indexPath.row] indexPath:indexPath];
        }
        return cell ;
        
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    if (indexPath.section == 0) {
//        if (self.artHotArray.count > 0) {
//            YXArtZhanxiaoModel *model = self.artHotArray[indexPath.row];
//            Goods *goodModel = [[Goods alloc] initWithModel:model];
//            goodModel.sales_mode = @"0";//展销
//            self.didSelectCellBlock(indexPath,goodModel) ;
//        }
//    }
//    else if (indexPath.section == 1) {
//        if (self.artNewArray.count > 0) {
//            YXArtZhanxiaoModel *model = self.artNewArray[indexPath.row];
//            Goods *goodModel = [[Goods alloc] initWithModel:model];
//            goodModel.sales_mode = @"0";
//            self.didSelectCellBlock(indexPath,goodModel) ;
//        }
//    }
//    else if (indexPath.section == 2) {
//        if (self.artSoldArray.count > 0) {
//            YXArtZhanxiaoModel *model = self.artSoldArray[indexPath.row];
//            Goods *goodModel = [[Goods alloc] initWithModel:model];
//            goodModel.sales_mode = @"0";
//            self.didSelectCellBlock(indexPath,goodModel) ;
//        }
//    }
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(UIScreenWidth/2-2, UIScreenWidth/2+40);
    }
    else if (indexPath.section == 1) {
        return CGSizeMake(UIScreenWidth/4-3, UIScreenWidth/4);
    }
    else if (indexPath.section == 2) {
        return CGSizeMake(UIScreenWidth/2-2, UIScreenWidth/2+20);
    }
    return CGSizeMake(0, 0);
    
}

#pragma mark <UICollectionViewDelegate>
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = {UIScreenWidth, 60};
    return size;
}


- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //设置SectionHeader
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        ZIKMoreCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kArtDetailMoreHeadViewReuseView forIndexPath:indexPath];
//        kWeakSelf
//        view.moreButtonBlock = ^(NSIndexPath *indexPath,id item){
//            weakSelf.didClickMoreButtonBlock(indexPath, item);
//        };
//        if (indexPath.section == 0) {
//            [view configureTitle:Localized(@"热门点击") color:[UIColor blackColor] index:indexPath];
//        }
//        else if (indexPath.section == 1) {
//            [view configureTitle:Localized(@"精选新品") color:[UIColor redColor] index:indexPath];
//        }
//        else if (indexPath.section == 2) {
//            [view configureTitle:Localized(@"已成交") color:[UIColor redColor] index:indexPath];
//        }
        return view;
        
        
    }
    return nil;
}


@end
