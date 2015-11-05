//
//  ViewController.m
//  AlterViewBlockDemo
//
//  Created by Seven on 15/4/28.
//  Copyright (c) 2015年 seven. All rights reserved.
//

#import "ViewController.h"
#import "BlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BlockAlertView *alert = [[BlockAlertView alloc] initWithTitle:@"test" message:@"hahahahah" cancelButtonTitle:@"cancel" otherButtonTitles:@[@"i",@"j",@"k"] alertBlock:^(NSInteger index) {
        NSLog(@"num: %ld",index);
    }];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
