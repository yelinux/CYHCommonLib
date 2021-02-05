//
//  GTableView.h
//  boti
//
//  Created by 吉川首寺v2 on 2020/5/9.
//  Copyright © 2020 创途. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ScrollViewDidScrollBlock)(UIScrollView *scrollView);
typedef void (^ScrollViewWillBeginDraggingBlock)(UIScrollView *scrollView);
typedef void (^ScrollViewDidEndDraggingBlock)(UIScrollView *scrollView, BOOL decelerate);

@interface GTableView : UITableView

@property(strong, nonatomic) NSArray <TBSectionModel*>*sectionModelList;
@property(copy, nonatomic) ScrollViewDidScrollBlock scrollViewDidScrollBlock;
@property(copy, nonatomic) ScrollViewWillBeginDraggingBlock scrollViewWillBeginDraggingBlock;
@property(copy, nonatomic) ScrollViewDidEndDraggingBlock scrollViewDidEndDraggingBlock;

@end

NS_ASSUME_NONNULL_END
