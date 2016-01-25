//
//  NewsModel.m
//  News
//
//  Created by vic on 16/1/21.
//  Copyright © 2016年 NW. All rights reserved.
//

#import "NewsModel.h"

@interface NewsModel()
@property (nonatomic, strong) NSString *cover;
//- (NSURL*)urlWitString:(NSString *)string;
@end

@implementation NewsModel

+ (instancetype)instanceWithJson:(NSDictionary *)json {
    NewsModel *news = [[NewsModel alloc] initWihJson:json];
    return news;
}
- (instancetype)initWihJson:(NSDictionary *)json {
    if (self = [super init]) {
        if (json.count > 0) {
            self.mid = json[@"id"];
            self.title = json[@"title"];
            self.cover = json[@"cover"];
            self.content = json[@"content"];
        }
    }
    return self;
}
#pragma mark - Method Private
- (NSURL*)urlWitString:(NSString *)string {
    return [NSURL URLWithString:string];
}
#pragma mark - Getter
- (NSURL*)coverUrl {
    if (!_coverUrl) {
        _coverUrl = [self urlWitString:self.cover];
    }
    return _coverUrl;
}

@end
