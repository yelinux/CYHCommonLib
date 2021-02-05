//
//  GTableView.m
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import "GTableView.h"

@interface GTableView()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSMutableDictionary *heightCache;

@end

@implementation GTableView

-(NSMutableDictionary *)heightCache{
    if (_heightCache == nil) {
        _heightCache = [NSMutableDictionary dictionary];
    }
    return _heightCache;;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark UITableViewDelegate UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionModelList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    if (groupModel.viewForHeader) {
        return groupModel.sectionHeaderHeight;
    }
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    if (groupModel.viewForHeader) {
        return groupModel.viewForHeader(tableView);
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    return groupModel.rowModelList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:indexPath.section];
    TBRowModel *childModel = [groupModel.rowModelList objectAtIndex:indexPath.row];
    return childModel.rowHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:indexPath.section];
    TBRowModel *childModel = [groupModel.rowModelList objectAtIndex:indexPath.row];
    return childModel.cellForRow(tableView, indexPath);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    if (groupModel.viewForFooter) {
        return groupModel.sectionFooterHeight;
    }
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    if (groupModel.viewForFooter) {
        return groupModel.viewForFooter(tableView);
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollViewDidScrollBlock) {
        self.scrollViewDidScrollBlock(scrollView);
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.scrollViewWillBeginDraggingBlock) {
        self.scrollViewWillBeginDraggingBlock(scrollView);
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.scrollViewDidEndDraggingBlock) {
        self.scrollViewDidEndDraggingBlock(scrollView, decelerate);
    }
}

//height cache
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
//    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
//    groupModel.estimatedSectionHeaderHeight = view.frame.size.height;
    [self.heightCache setObject:@(view.frame.size.height) forKey:[NSString stringWithFormat:@"header_%ld", section]];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    id h = [self.heightCache objectForKey:[NSString stringWithFormat:@"header_%ld", section]];
    if (h) {
        return [h floatValue];
    }
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    return groupModel.estimatedSectionHeaderHeight;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:indexPath.section];
//    TBRowModel *childModel = [groupModel.rowModelList objectAtIndex:indexPath.row];
//    childModel.estimatedRowHeight = cell.frame.size.height;
    [self.heightCache setObject:@(cell.frame.size.height) forKey:[NSString stringWithFormat:@"cell_%ld_%ld", indexPath.section, indexPath.row]];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id h = [self.heightCache objectForKey:[NSString stringWithFormat:@"cell_%ld_%ld", indexPath.section, indexPath.row]];
    if (h) {
        return [h floatValue];
    }
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:indexPath.section];
    TBRowModel *childModel = [groupModel.rowModelList objectAtIndex:indexPath.row];
    return childModel.estimatedRowHeight;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section{
//    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
//    groupModel.estimatedSectionFooterHeight = view.frame.size.height;
    [self.heightCache setObject:@(view.frame.size.height) forKey:[NSString stringWithFormat:@"footer_%ld", section]];
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    id h = [self.heightCache objectForKey:[NSString stringWithFormat:@"footer_%ld", section]];
    if (h) {
        return [h floatValue];
    }
    TBSectionModel *groupModel = [self.sectionModelList objectAtIndex:section];
    return groupModel.estimatedSectionFooterHeight;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
