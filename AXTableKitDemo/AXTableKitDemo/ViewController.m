//
//  ViewController.m
//  AXTableKitDemo
//
//  Created by xaoxuu on 27/10/2017.
//  Copyright © 2017 xaoxuu. All rights reserved.
//

#import "ViewController.h"
#import <AXTableKit/AXTableKit.h>
#import "Test2.h"


@interface ViewController ()

@property (strong, nonatomic) Test2 *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[Test2 alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
