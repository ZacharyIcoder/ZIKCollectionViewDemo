//
//  ZIKMVVMAbstractRequestViewModel.h
//  Mobileyx
//
//  Created by ZIKong on 2017/5/19.
//  Copyright © 2017年 www.appservice.wang. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求成功block
 */
typedef void (^successBlock)(id responseObject);

/**
 *  请求失败block
 */
typedef void (^failureBlock)(NSError *error);

/**
 *  请求响应block
 */
typedef void (^responseBlock)(id dataObj, NSError *error);

/**
 *  监听进度响应block
 */
typedef void (^progressBlock)(NSProgress * progress);

/**
 *  缓存信息block
 */
typedef void (^CacheInfoBlock)(id cacheResponseObject);

@interface ZIKMVVMAbstractRequestViewModel : NSObject

@end
