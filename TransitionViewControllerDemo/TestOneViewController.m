//
//  TestOneViewController.m
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import "TestOneViewController.h"
#import "WKViewControllerManager.h"

@interface TestOneViewController ()

@end

@implementation TestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
	NSLog(@"----TestOneViewController  didload-");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[[WKViewControllerManager sharedManager] backToMainViewController];
}
- (void)dealloc {
	NSLog(@"----TestOneViewController dealloc--");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
