//
//  ZIKRequestViewModel.h
//  ZIKCollectionViewDemo
//
//  Created by ZIKong on 2017/5/25.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import "ZIKMVVMAbstractRequestViewModel.h"

@interface ZIKRequestViewModel : ZIKMVVMAbstractRequestViewModel
- (void)mvvm_viewModelRequestDataWithInfo:(id)info cache:(CacheInfoBlock)cacheInfo success:(successBlock)success error:(failureBlock)fail;
@end
