//
//  ViewController.m
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import "ViewController.h"
#import "WKViewControllerManager.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:self.leftBtn];
	[self.view addSubview:self.rightBtn];
}
- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self.view bringSubviewToFront:self.leftBtn];
	[self.view bringSubviewToFront:self.rightBtn];
}
- (void)leftAction {
	[[WKViewControllerManager sharedManager] didSelectedAtIndex:0];
}

- (void)rightAction {
	[[WKViewControllerManager sharedManager] didSelectedAtIndex:1];
}

#pragma mrk - subviews
- (UIButton *)leftBtn {
	if (_leftBtn == nil) {
		_leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		_leftBtn.frame = CGRectMake(0, 60, 100, 100);
		_leftBtn.backgroundColor = [UIColor blueColor];
		[_leftBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
	}
	return _leftBtn;
}

- (UIButton *)rightBtn {
	if (_rightBtn == nil) {
		_rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
		_rightBtn.frame = CGRectMake(kScreenWidth - 100, 60, 100, 100);
		_rightBtn.backgroundColor = [UIColor blueColor];
		[_rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
	}
	return _rightBtn;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
