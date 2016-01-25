//
//  NewsModel.h
//  News
//
//  Created by vic on 16/1/21.
//  Copyright © 2016年 NW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, strong) NSNumber *mid;
@property (nonatomic, strong) NSURL *coverUrl;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *title;

+ (instancetype)instanceWithJson:(NSDictionary *)json;

- (instancetype)initWihJson:(NSDictionary *)json;

@end
