//
//  BlockAlertView.h
//  AlterViewBlockDemo
//
//  Created by Seven on 15/4/28.
//  Copyright (c) 2015年 seven. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertViewBlock)(NSInteger index);

@interface BlockAlertView : UIAlertView

@property (nonatomic, copy) AlertViewBlock alertBlock;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                   alertBlock:(AlertViewBlock)block;

@end
