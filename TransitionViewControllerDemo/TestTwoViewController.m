//
//  TestTwoViewController.m
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import "TestTwoViewController.h"
#import "WKViewControllerManager.h"

@interface TestTwoViewController ()

@end

@implementation TestTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor purpleColor];
	NSLog(@"----TestTwoViewController  didload-");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[[WKViewControllerManager sharedManager] backToMainViewController];
}
- (void)dealloc {
	NSLog(@"----TestTwoViewController dealloc--");
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
