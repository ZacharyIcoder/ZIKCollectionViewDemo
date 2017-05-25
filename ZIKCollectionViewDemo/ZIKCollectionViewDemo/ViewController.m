//
//  ViewController.m
//  ZIKCollectionViewDemo
//
//  Created by ZIKong on 2017/5/25.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "ViewController.h"
#import "ZIKRequestViewModel.h"
#import "ZIKCollectionViewModel.h"

#define kWeakSelf __weak typeof(self) weakSelf = self;

@interface ViewController ()

@property (nonatomic, strong) ZIKRequestViewModel    *requestViewModel;
@property (nonatomic, strong) ZIKCollectionViewModel *collectionViewModel;
@property (nonatomic, strong) UICollectionView       *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionViewModel handleWithCollectionView:self.collectionView];
    [self requestData];
}

- (void)requestData {
    kWeakSelf
    [self.requestViewModel mvvm_viewModelRequestDataWithInfo:nil cache:^(id cacheResponseObject) {
        ;
    } success:^(id responseObject) {
        [weakSelf.collectionViewModel getDataWithModelArray:^id{
            return responseObject;
        } completion:^{
            [weakSelf.collectionView reloadData];
        }];
    } error:^(NSError *error) {
        ;
    }];
}

#pragma mark - 懒加载
-(ZIKRequestViewModel *)requestViewModel {
    if (_requestViewModel == nil) {
        _requestViewModel = [[ZIKRequestViewModel alloc] init];
    }
    return _requestViewModel;
}

-(ZIKCollectionViewModel *)collectionViewModel {
    if (_collectionViewModel == nil) {
        _collectionViewModel = [[ZIKCollectionViewModel alloc] init];
    }
    return _collectionViewModel;
}

-(UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
