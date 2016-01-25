//
//  NewsProvider.h
//  News
//
//  Created by vic on 16/1/22.
//  Copyright © 2016年 NW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsProvider : NSObject

+ (instancetype)shareInstance;

- (void)fetchInfoListSuccess:(void(^)(NSArray *list))success
                     failure:(void(^)(NSError *error))failure;

@end
