//
//  NewsCell.m
//  News
//
//  Created by vic on 16/1/25.
//  Copyright © 2016年 NW. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import <UIImageView+AFNetworking.h>

@interface NewsCell()


@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation NewsCell

- (void)setNews:(NewsModel *)news {
    _news = news;
    [self.coverImageView setImageWithURL:news.coverUrl];
    self.titleLabel.text = news.title;
}

@end
