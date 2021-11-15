//
//  YHItemModel.m
//  CYHCommonLib
//
//  Created by chenyehong on 2021/11/11.
//

#import "YHItemModel.h"

@interface YHItemModel()

@end

@implementation YHItemModel

-(instancetype)dequeueReusable: (SetDataBlock)setDataBlock
          estimatedHeightBlock: (YHHeightBlock)estimatedHeightBlock
                   heightBlock: (YHHeightBlock)heightBlock
            displayHeightBlock: (YHDisplayHeightBlock _Nullable)displayHeightBlock{
    _setDataBlock = setDataBlock;
    _estimatedHeightBlock = estimatedHeightBlock;
    _heightBlock = heightBlock;
    _displayHeightBlock = displayHeightBlock;
    return self;
}

-(instancetype)dequeueReusable: (SetDataBlock)setDataBlock
                        height: (CGFloat)height{
    _setDataBlock = setDataBlock;
    _estimatedHeightBlock = ^CGFloat{
        return height;
    };
    _heightBlock = ^CGFloat{
        return height;
    };
    _displayHeightBlock = nil;
    return self;
}


@end
