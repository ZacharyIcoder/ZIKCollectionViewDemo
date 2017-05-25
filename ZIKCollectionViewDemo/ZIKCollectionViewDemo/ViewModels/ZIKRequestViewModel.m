//
//  ZIKRequestViewModel.m
//  ZIKCollectionViewDemo
//
//  Created by ZIKong on 2017/5/25.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "ZIKRequestViewModel.h"
#import "ZIKDataModel.h"
#import "YYModel.h"
@interface ZIKRequestViewModel ()

@property (nonatomic, strong) NSMutableArray *artHotGoodsMArray;    //热门商品
@property (nonatomic, strong) NSMutableArray *artNewGoodsMArray;    //最新上架
@property (nonatomic, strong) NSMutableArray *artSoldGoodsMArray;   //已成交商品

@end

@implementation ZIKRequestViewModel
- (void)mvvm_viewModelRequestDataWithInfo:(id)info cache:(CacheInfoBlock)cacheInfo success:(successBlock)success error:(failureBlock)fail{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ACU" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    //NSLog(@"dictionary = %@",dictionary);
    NSDictionary *objc = dictionary[@"data"];
    NSArray *hotGoods  =  [objc objectForKey:@"hotGoods"];
    if (self.artHotGoodsMArray.count > 0) {
        [self.artHotGoodsMArray removeAllObjects];
    }
    if (hotGoods && hotGoods.count > 0) {
        [hotGoods enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            ZIKDataModel *model = [ZIKDataModel yy_modelWithDictionary:dic];
            [self.artHotGoodsMArray addObject:model];
        }];
    }
    NSArray *newGoods  =  [objc objectForKey:@"newGoods"];
    if (self.artNewGoodsMArray.count > 0) {
        [self.artNewGoodsMArray removeAllObjects];
    }
    if (newGoods && newGoods.count > 0) {
        [newGoods enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            ZIKDataModel *model = [ZIKDataModel yy_modelWithDictionary:dic];
            [self.artNewGoodsMArray addObject:model];
        }];
    }
    NSArray *soldGoods =  [objc objectForKey:@"soldGoods"];
    if (self.artSoldGoodsMArray.count > 0) {
        [self.artSoldGoodsMArray removeAllObjects];
    }
    if (soldGoods && soldGoods.count > 0) {
        [soldGoods enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            ZIKDataModel *model = [ZIKDataModel yy_modelWithDictionary:dic];
            [self.artSoldGoodsMArray addObject:model];
        }];
    }
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.artHotGoodsMArray,@"hotGoods",self.artNewGoodsMArray,@"newGoods",self.artSoldGoodsMArray,@"soldGoods",nil];
    success(dic);

}

-(NSMutableArray *)artHotGoodsMArray {
    if (_artHotGoodsMArray == nil) {
        _artHotGoodsMArray = [NSMutableArray arrayWithCapacity:4];
    }
    return _artHotGoodsMArray;
}

-(NSMutableArray *)artNewGoodsMArray {
    if (_artNewGoodsMArray == nil) {
        _artNewGoodsMArray = [NSMutableArray arrayWithCapacity:8];
    }
    return _artNewGoodsMArray;
}

-(NSMutableArray *)artSoldGoodsMArray {
    if (_artSoldGoodsMArray == nil) {
        _artSoldGoodsMArray = [NSMutableArray arrayWithCapacity:4];
    }
    return _artSoldGoodsMArray;
}

@end
