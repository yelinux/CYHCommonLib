//
//  UITableView+YHExpand.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import "UITableView+YHExpand.h"
#import <objc/runtime.h>

@interface UITableView()

@property (strong, nonatomic, readonly) NSMutableSet *registerSet;

@end

@implementation UITableView (YHExpand)

-(void)registerHeaderFooter: (Class)headerFooterClass{
    NSString *key = NSStringFromClass(headerFooterClass);
    if (![self.registerSet containsObject:key]) {
        if ([[NSBundle mainBundle] pathForResource:key ofType:@"nib"]) {
            [self registerNib:[UINib nibWithNibName:key bundle:nil] forHeaderFooterViewReuseIdentifier:key];
        } else {
            [self registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:key];
        }
        [self.registerSet addObject:key];
    }
}

-(void)registerCell: (Class)cellClass{
    NSString *key = NSStringFromClass(cellClass);
    if (![self.registerSet containsObject:key]) {
        if ([[NSBundle mainBundle] pathForResource:key ofType:@"nib"]) {
            [self registerNib:[UINib nibWithNibName:key bundle:nil] forCellReuseIdentifier:key];
        } else {
            [self registerClass:cellClass forCellReuseIdentifier:key];
        }
        [self.registerSet addObject:key];
    }
}

-(NSMutableSet *)registerSet{
    NSMutableSet *rgtSet = objc_getAssociatedObject(self, @selector(registerSet));
    if (!rgtSet) {
        rgtSet = NSMutableSet.new;
        objc_setAssociatedObject(self, @selector(registerSet), rgtSet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return rgtSet;
}

-(void)setYhDelegate:(YHBaseDelegate *)yhDelegate{
    objc_setAssociatedObject(self, @selector(yhDelegate), yhDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    yhDelegate.tableView = self;
    self.delegate = yhDelegate;
    self.dataSource = yhDelegate;
    [yhDelegate configTableView];
}

-(YHBaseDelegate *)yhDelegate{
    return objc_getAssociatedObject(self, @selector(yhDelegate));;
}

@end
