//
//  NewsProvider.m
//  News
//
//  Created by vic on 16/1/22.
//  Copyright © 2016年 NW. All rights reserved.
//

#import "NewsProvider.h"
#import <AFNetworking.h>
#import "NewsModel.h"

@implementation NewsProvider

static NewsProvider *_provier;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _provier = [[self alloc] init];
    });
    return _provier;
}

- (void)fetchInfoListSuccess:(void(^)(NSArray *list))success
                     failure:(void(^)(NSError *error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURL *URL = [NSURL URLWithString:@"http://localhost:3000/api/v1/infos?page=1&per_page=20"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                failure(error);
            }
        } else {
            if (success ) {
                NSDictionary *dic = (NSDictionary *)responseObject;
                if (dic.count > 0) {
                    NSArray *infos = (NSArray*)dic[@"infos"];
                    NSMutableArray *mutalbeArray= [[NSMutableArray alloc] init];
                    for (NSDictionary *info in infos) {
                        NewsModel *news = [NewsModel instanceWithJson:info];
                        [mutalbeArray addObject:news];
                    }
                    success(mutalbeArray);
                }
            }
        }
    }];
    [dataTask resume];
}

@end
