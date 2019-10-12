//
//  ViewController.m
//  WxxMain
//
//  Created by Cassie on 2019/10/10.
//  Copyright © 2019 Cassie. All rights reserved.
//

#import "ViewController.h"
#import <MGJRouter/MGJRouter.h>
#import <WxxModuleA/AViewController.h>


typedef struct WxxData {
    NSString *title;
    NSString *url;
    NSDictionary *userInfo;
} WxxData;

NS_INLINE WxxData WxxDataMaker(NSString *title, NSString *url, NSDictionary *userInfo){
    WxxData wxxdata;
    wxxdata.title = title;
    wxxdata.url = url;
    wxxdata.userInfo = userInfo;
    return wxxdata;
}

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Test";
    [self.view addSubview:self.tableView];
}

#pragma mark - Data Init

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        WxxData data1 = WxxDataMaker(@"Open Module A", @"wxx://moduleA", nil);
        NSValue *data1Value = [NSValue valueWithBytes:&data1 objCType:@encode(struct WxxData)];
        _dataArray = [[NSArray alloc] initWithObjects:data1Value, nil];
    }
    return  _dataArray;
}


#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (indexPath.row < self.dataArray.count) {
        WxxData data = [self wxxDataOfIndex:indexPath.row];
        cell.textLabel.text = data.title;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.dataArray.count) {
        WxxData data = [self wxxDataOfIndex:indexPath.row];
        [MGJRouter openURL:data.url withUserInfo:data.userInfo completion:nil];
    }
}


- (WxxData)wxxDataOfIndex:(NSUInteger)index {
    NSValue *value = self.dataArray[index];
    WxxData data;
    [value getValue:&data];
    return data;
}

#pragma mark - For Test
- (id)vcFromUrl:(NSString *)url {
    return [MGJRouter objectForURL:url];
}


@end
