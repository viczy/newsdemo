//
//  ContentViewController.m
//  News
//
//  Created by vic on 16/1/25.
//  Copyright © 2016年 NW. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ContentViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWeb];
}

#pragma mark - Method

- (void)loadWeb {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.contentUrl]];
    [self.webView loadRequest:request];
}

@end
