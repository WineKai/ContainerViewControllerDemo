//
//  WKTransitionViewController.m
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import "WKTransitionViewController.h"

@interface WKTransitioncChildControllerModel()

@end

@implementation WKTransitioncChildControllerModel

+ (instancetype)modelWithViewController:(UIViewController *)viewController direction:(WKViewControllerDirection)direction {
	WKTransitioncChildControllerModel *model = [[WKTransitioncChildControllerModel alloc] init];
	model.viewController = viewController;
	model.direction = direction;
	return model;
}
@end


@interface WKTransitionViewController ()

@property (nonatomic, copy) NSArray *viewControllers;

//@property (nonatomic, copy, readwrite) NSArray <WKTransitioncChildControllerModel *>*viewControllerModels;

@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic, assign) WKViewControllerDirection currentDirection;



@end

@implementation WKTransitionViewController

//- (instancetype)initWithViewControllers:(NSArray *)viewControllers directions:(NSArray *)directions {
//	if (self = [super init]) {
//		self.viewControllerModels = viewControllers;
//		self.directions = directions;
//		[self prepareSetting];
//	}
//	return self;
//}

- (instancetype)initWithChildViewControllerModels:(NSArray<WKTransitioncChildControllerModel *> *)viewControllerModels {
	if (self = [super init]) {
		self.view.frame = [UIScreen mainScreen].bounds;
		self.viewControllerModels = viewControllerModels;
		[self prepareSetting];
	}
	return self;
}

- (instancetype)init {
	if (self = [super init]) {
		self.view.frame = [UIScreen mainScreen].bounds;
	}
	return self;
}
- (void)prepareSetting {
	
}

- (void)setViewControllerModels:(NSArray<WKTransitioncChildControllerModel *> *)viewControllerModels {
	_viewControllerModels = viewControllerModels;
	for (WKTransitioncChildControllerModel *itemModel in self.viewControllerModels) {
		if (itemModel.direction == WKViewControllerDirectionMainVC) {
			self.mainViewController = itemModel.viewController;
		}
	}
}
- (void)setMainViewController:(UIViewController *)mainViewController {
	_mainViewController = mainViewController;
	_mainViewController.view.frame = self.view.bounds;
	[self addChildViewController:_mainViewController];
	[self.view addSubview:_mainViewController.view];
	[_mainViewController didMoveToParentViewController:self];
}
- (void)setCurrentVC:(UIViewController *)currentVC {
	
	if (_currentVC == currentVC) {
		return;
	}
	[self removeInactiveVC:_currentVC];
	_currentVC = currentVC;
	[self updateActiveViewContrller];
}

- (void)didSelectedAtIndex:(NSInteger)index {
	if (index < self.viewControllerModels.count) {
		WKTransitioncChildControllerModel *model = self.viewControllerModels[index];
		if (model.viewController == self.mainViewController) {
			return;
		}
		self.currentDirection = model.direction;
		self.currentVC = model.viewController;
	} else {
		NSAssert(false, @"没有这个控制器");
	}
}
- (void)backToMainViewController {

	[self removeInactiveVC:self.currentVC];
	
}
- (void)removeInactiveVC:(UIViewController *)inActiveVC {
	if (inActiveVC) {
		[inActiveVC willMoveToParentViewController:nil];
		if (self.currentDirection == WKViewControllerDirectionMainVC) {
	
			[inActiveVC.view removeFromSuperview];
			[inActiveVC removeFromParentViewController];
			_currentVC = nil;
		} else {
			[UIView animateWithDuration:0.2 animations:^{
				inActiveVC.view.frame = [self dismissToFrame];
			} completion:^(BOOL finished) {
				
				[inActiveVC.view removeFromSuperview];
				[inActiveVC removeFromParentViewController];
				self.currentVC = nil;
			}];
		}

	}

	
}


- (void)updateActiveViewContrller {
	if (self.currentVC) {
		[self addChildViewController:self.currentVC];
		
		if (self.currentDirection == WKViewControllerDirectionMainVC) {
			self.currentVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
			[self.view addSubview:self.currentVC.view];
			[self.currentVC didMoveToParentViewController:self];
			
		} else {
			self.currentVC.view.frame = [self dismissToFrame];
			[self.view addSubview:self.currentVC.view];
			[UIView animateWithDuration:0.2 animations:^{
				self.currentVC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
			}completion:^(BOOL finished) {
				
				[self.currentVC didMoveToParentViewController:self];
			}];
		}

	}

}

- (CGRect)dismissToFrame {
	CGRect frame;
	switch (self.currentDirection) {
		case WKViewControllerDirectionForward:
			frame = CGRectMake(-kScreenWidth, 0, kScreenWidth, kScreenHeight);
			break;
		case WKViewControllerDirectionReverse:
			frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight);
			break;
		case WKViewControllerDirectionMoveDown:
			frame = CGRectMake(0, -kScreenHeight, kScreenWidth, kScreenHeight);
			break;
		case WKViewControllerDirectionMoveUp:
			frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight);
			break;
		case WKViewControllerDirectionMainVC:
			frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
			break;
		default:
			frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
			break;
	}
	return frame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
