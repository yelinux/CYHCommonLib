//
//  YHTableViewController.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import "YHTableViewController.h"
#import "UITableView+YHExpand.h"
#import "TBTestHeader.h"
#import "TBTestCell.h"
#import "TBTestFooter.h"

@interface YHTableViewController ()

@end

@implementation YHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0],
        [tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0],
        [tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
        [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0],
    ]];
    
    tableView.yhDelegate = [[YHBaseDelegate alloc] init];
//    tableView.yhDelegate = [[YHEstimatedDelegate alloc] init];
    
    [tableView.yhDelegate.sectionModels removeAllObjects];
    
    YHSectionModel *sectionModel = [tableView.yhDelegate createSectionModel];
    
    [YHAddHeader(sectionModel, TBTestHeader) dequeueReusable:^(TBTestHeader * _Nonnull header) {
        header.lb.text = @"这是Header";
    } height:50];

    for(int i = 0 ; i < 5 ; i++){
        [YHAddRow(sectionModel, TBTestCell) dequeueReusable:^(TBTestCell * _Nonnull cell) {
            cell.lb.text = [NSString stringWithFormat:@"这是cell %d", i];
        } height:50];
    }
    
    [YHAddFooter(sectionModel, TBTestFooter) dequeueReusable:^(TBTestFooter * _Nonnull footer) {
        footer.lb.text = @"这是footer";
    } height:50];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
