//
//  BlockAlertView.m
//  AlterViewBlockDemo
//
//  Created by Seven on 15/4/28.
//  Copyright (c) 2015年 seven. All rights reserved.
//

#import "BlockAlertView.h"

@interface BlockAlertView ()<UIAlertViewDelegate>

@end

@implementation BlockAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSArray *)otherButtonTitles
                   alertBlock:(AlertViewBlock)block
{
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
        if(otherButtonTitles.count)
        {
            for (NSString *str in otherButtonTitles) {
                [self addButtonWithTitle:str];
            }
        }
        self.alertBlock = block;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.alertBlock) {
        self.alertBlock(buttonIndex);
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
