//
//  ViewController.m
//  AXTableKitDemo
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "ViewController.h"
#import <AXTableKit/AXTableKit.h>
#import "MyTableView.h"

@interface ViewController ()

@property (strong, nonatomic) MyTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[MyTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"dealloc");
}



@end
