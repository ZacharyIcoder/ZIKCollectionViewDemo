//
//  UITableViewCell+MVVMTableViewCellConfigure.m
//  Mobileyx
//
//  Created by ZIKong on 2017/4/7.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "UITableViewCell+MVVMTableViewCellConfigure.h"

@implementation UITableViewCell (MVVMTableViewCellConfigure)

#pragma mark - private
+ (UINib *)nibWithIdentifier:(NSString *)identifier {
    return [UINib nibWithNibName:identifier bundle:nil];
}

#pragma mark - public
+ (void)mvvm_registerTable:(UITableView *)table nibIdentifier:(NSString *)identifier {
    [table registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}

+ (void)mvvm_registerTable:(UITableView *)table classIdentifier:(NSString *)identifier {
    [table registerClass:[self class] forCellReuseIdentifier:identifier];
}


#pragma mark - rewrite these function in subclass
- (void)mvvm_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    // rewrite this function in subclass
}

- (void)mvvm_configure:(UITableViewCell *)UITableViewCell viewModel:(id)viewModel indexPath:(NSIndexPath *)indexPath {
    // rewrite this function in subclass
}

+ (CGFloat)mvvm_getCellHeightWithModel:(id)model indexPaht:(NSIndexPath *)indexPath {
    // rewrite this function in subclass
    if (!model) {
        return 0.0f; //if obj is null
    }
    return 44.0f; //default cell height
}
@end
