//
//  YHItemModel.h
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGFloat (^YHHeightBlock)(void);
typedef void(^YHDisplayHeightBlock)(CGFloat height);

@interface YHItemModel<__covariant T: UIView *> : NSObject

typedef void(^SetDataBlock)(T view);

@property (copy, nonatomic) NSString *reusableIdentifier;
@property (copy, nonatomic) YHHeightBlock estimatedHeightBlock;
@property (copy, nonatomic) YHHeightBlock heightBlock;
@property (copy, nonatomic) YHDisplayHeightBlock displayHeightBlock;

@property (copy, nonatomic) SetDataBlock setDataBlock;

-(instancetype)dequeueReusable: (SetDataBlock)setDataBlock
          estimatedHeightBlock: (YHHeightBlock)estimatedHeightBlock
                   heightBlock: (YHHeightBlock)heightBlock
            displayHeightBlock: (YHDisplayHeightBlock _Nullable)displayHeightBlock;

-(instancetype)dequeueReusable: (SetDataBlock)setDataBlock
                        height: (CGFloat)height;

@end

NS_ASSUME_NONNULL_END
