//
//  TBDataDelegate.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/3/1.
//

#import "TBDataDelegate.h"

@interface TBDataDelegate()

@property(strong, nonatomic) NSMutableDictionary *heightCache;

@end

@implementation TBDataDelegate

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
        return groupModel.viewForHeader(tableView, section);
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
        return groupModel.viewForFooter(tableView, section);
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//height cache
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
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

#pragma mark - getter
-(NSMutableDictionary *)heightCache{
    if (_heightCache == nil) {
        _heightCache = [NSMutableDictionary dictionary];
    }
    return _heightCache;;
}

@end
