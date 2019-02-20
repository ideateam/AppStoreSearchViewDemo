//
//  ViewController.m
//  AppStoreSearchViewDemo
//
//  Created by MacOS on 2018/11/8.
//  Copyright © 2018年 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "defineArgue.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) HeaderView *headerView;
@property(nonatomic,strong) UIView *statusCoverView;
@property(nonatomic,strong) UIView *tableCoverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.dataArray = @[@"王者荣耀",@"大话西游",@"宝宝树",@"腾讯视频",@"喜马拉雅",@"智联招聘"];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, StatusBarHeight + NavigationBarHeight, ScreenW, ScreenH - StatusBarHeight - NavigationBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    UIView *statusCoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, StatusBarHeight)];
    [self.view addSubview:statusCoverView];
    self.statusCoverView = statusCoverView;
    
    statusCoverView.backgroundColor = [UIColor whiteColor];
    statusCoverView.hidden = YES;
    
    UIView *tableCoverView = [[UIView alloc] initWithFrame:CGRectMake(0, StatusBarHeight + 60, ScreenW, ScreenH - StatusBarHeight - TabbarHeight - 60)];
    [self.view addSubview:tableCoverView];
    self.tableCoverView = tableCoverView;
    
    tableCoverView.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.4];
    tableCoverView.alpha = 0;
    
    UITapGestureRecognizer *tapTableCoverView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClickCancel)];
    [tableCoverView addGestureRecognizer:tapTableCoverView];
}

- (void)moveTopMargin{
    __weak typeof (self)weakSelf = self;
    self.tableCoverView.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.tableView.frame = CGRectMake(0,- 50, ScreenW, ScreenH - StatusBarHeight + 50);
        weakSelf.headerView.searchView.searchTextTF.frame = CGRectMake(15, 0, ScreenW - 15 - 60, 60 - 25);
        weakSelf.statusCoverView.hidden = NO;
        
    } completion:^(BOOL finished) {
        weakSelf.headerView.searchView.searchContentBTN.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            weakSelf.tableCoverView.alpha = 1;
        }];
    }];
}

- (void)headClickCancel{
    __weak typeof (self)weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.tableCoverView.alpha = 0;
    }];
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.tableView.frame = CGRectMake(0, StatusBarHeight + NavigationBarHeight, ScreenW, ScreenH - StatusBarHeight - NavigationBarHeight);
        weakSelf.headerView.searchView.searchTextTF.frame = CGRectMake(15, 0, ScreenW - 30 , 60 - 25);
        [weakSelf.headerView.searchView.searchTextTF resignFirstResponder];
        weakSelf.headerView.searchView.searchContentBTN.hidden = YES;

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.statusCoverView.hidden = YES;
        }];
    }];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HeaderView *headView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    self.headerView = headView;
     __weak typeof (self)weakSelf = self;
    headView.searchView.tapChange = ^{
        [weakSelf moveTopMargin];
    };
    
    headView.searchView.clickCancel = ^{
        [weakSelf headClickCancel];
    };
    
    if (section == 0) {
        return nil;
    }else{
        return headView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 0;
    }else{
        return 60;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else {
        return self.dataArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    if ([indexPath section] == 0) {
        cell.textLabel.font = [UIFont systemFontOfSize:25];
        cell.textLabel.text = @"搜索";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
        
        if (indexPath.row == 0) {
            cell.textLabel.font = [UIFont systemFontOfSize:17];
            cell.textLabel.text = @"热门搜索";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            cell.textLabel.font = [UIFont systemFontOfSize:17];
            cell.textLabel.text = self.dataArray[indexPath.row - 1];
            cell.textLabel.textColor = [UIColor blueColor];
        }
    }
    return cell;
}

@end
