//
//  ZIKNewCollectionViewCell.m
//  ZIKCollectionViewDemo
//
//  Created by ZIKong on 2017/5/25.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "ZIKNewCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "UICollectionViewCell+MVVMCollectionViewCellConfigure.h"
#import "ZIKDataModel.h"
@interface ZIKNewCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ZIKNewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)mvvm_configure:(UICollectionViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    ZIKDataModel *dataModel  = (ZIKDataModel *)model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:dataModel.goodspic] placeholderImage:[UIImage imageNamed:@"placeholder"]];

}
@end
