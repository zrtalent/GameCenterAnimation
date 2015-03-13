//
//  FirstViewController.m
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "FirstViewController.h"
#import "WFCollectionViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked {
    WFCollectionViewController *testController = [WFCollectionViewController newsController];
    [self presentViewController:testController animated:YES completion:^{
    }];
}

@end
