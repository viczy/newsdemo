//
//  ViewController.m
//  News
//
//  Created by vic on 16/1/21.
//  Copyright © 2016年 NW. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsProvider.h"
#import "NewsCell.h"
#import "ContentViewController.h"

@interface NewsViewController ()<
    UITableViewDataSource,
    UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *list;

@end

@implementation NewsViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchRemote];
}

#pragma mark - Prepare

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ContentViewController class]]) {
        ContentViewController *contentVC = (ContentViewController*)segue.destinationViewController;
        contentVC.contentUrl = sender;
    }
}

#pragma mark - Method Data

- (void)fetchRemote {
    [[NewsProvider shareInstance] fetchInfoListSuccess:^(NSArray *list) {
        self.list = list;
    } failure:^(NSError *error) {
        //
    }];
}

#pragma mark -  UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newscellreuse"];
    [cell setNews:self.list[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsModel *news= self.list[indexPath.row];
    [self performSegueWithIdentifier:@"show_content" sender:news.content];
}

#pragma mark - Setter

- (void)setList:(NSArray *)list{
    _list = list;
    [self.tableView reloadData];
}


@end
