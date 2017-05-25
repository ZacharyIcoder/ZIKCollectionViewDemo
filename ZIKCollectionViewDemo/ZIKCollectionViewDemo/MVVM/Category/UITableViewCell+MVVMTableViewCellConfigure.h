//
//  UITableViewCell+MVVMTableViewCellConfigure.h
//  Mobileyx
//
//  Created by ZIKong on 2017/4/7.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MVVMTableViewCellConfigure)

//从nib文件中根据重用标识符注册UITableViewCell
+ (void)mvvm_registerTable:(UITableView *)table
             nibIdentifier:(NSString *)identifier;
//从class中根据重用标识符注册UITableViewCell
+ (void)mvvm_registerTable:(UITableView *)table
           classIdentifier:(NSString *)identifier;

//根据model配置UITableViewCell,设置UITableViewCell内容
- (void)mvvm_configure:(UITableViewCell *)cell
                 model:(id)model
             indexPath:(NSIndexPath *)indexPath;
//根据viewModel配置UITableViewCell,设置UITableViewCell内容
- (void)mvvm_configure:(UITableViewCell *)UITableViewCell
             viewModel:(id)viewModel
             indexPath:(NSIndexPath *)indexPath;
//获取自定义对象的cell高度
+ (CGFloat)mvvm_getCellHeightWithModel:(id)model
                             indexPaht:(NSIndexPath *)indexPath;

@end
