//
//  TBTableViewController.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/2/5.
//

#import "TBTableViewController.h"
#import "TBTestHeader.h"
#import "TBTestCell.h"
#import "TBTestFooter.h"
#import "TBDataDelegate.h"

@interface TBTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TBDataDelegate *dataDelegate;

@end

@implementation TBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(TBTestHeader.class) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(TBTestHeader.class)];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(TBTestCell.class) bundle:nil] forCellReuseIdentifier:NSStringFromClass(TBTestCell.class)];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(TBTestFooter.class) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(TBTestFooter.class)];
    
    self.dataDelegate = [[TBDataDelegate alloc] init];
    self.tableView.delegate = self.dataDelegate;
    self.tableView.dataSource = self.dataDelegate;
    
    /**
     通过按照顺序添加header,cell,footer模型来显示ui，自带height缓存
     应用场景：
     需求频繁变动，今天产品要求cell1和cell2交换位置，明天要求换回来。
     */
    
    TBSectionModel *group = [[TBSectionModel alloc] init];
    [group createHeader:^UITableViewHeaderFooterView * _Nullable(UITableView * _Nonnull tableView) {
        TBTestHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([TBTestHeader class])];
        header.lb.text = @"这里是header";
        return header;
    } estimatedSectionHeaderHeight:60];
    
    [group.rowModelList addObject:[TBRowModel createWithBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        TBTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TBTestCell class]) forIndexPath:indexPath];
        cell.lb.text = @"这里是cell1";
        return cell;
    } estimatedRowHeight:50]];
    
    [group.rowModelList addObject:[TBRowModel createWithBlock:^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        TBTestCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TBTestCell class]) forIndexPath:indexPath];
        cell.lb.text = @"这里是cell2";
        return cell;
    } estimatedRowHeight:50]];
    
    [group createFooter:^UITableViewHeaderFooterView * _Nullable(UITableView * _Nonnull tableView) {
        TBTestFooter *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([TBTestFooter class])];
        footer.lb.text = @"这里是footer";
        return footer;
    } estimatedSectionFooterHeight:60];
    
    self.dataDelegate.sectionModelList = @[group];
    
    [self.tableView reloadData];
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
