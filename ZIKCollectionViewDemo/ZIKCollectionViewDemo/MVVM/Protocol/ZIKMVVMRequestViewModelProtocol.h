//
//  ZIKMVVMRequestViewModelProtocol.h
//  Mobileyx
//
//  Created by ZIKong on 2017/5/19.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZIKMVVMRequestViewModelProtocol <NSObject>

- (void)mvvm_viewModelRequestDataWithInfo:(id)info cache:(CacheInfoBlock)cacheInfo success:(successBlock)success error:(failureBlock)fail;
@end
