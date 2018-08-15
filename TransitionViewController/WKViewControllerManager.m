//
//  WKViewControllerManager.m
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import "WKViewControllerManager.h"
@interface WKViewControllerManager()
@property (nonatomic, strong, readwrite) WKTransitionViewController *transitionController;
@end
@implementation WKViewControllerManager
+ (WKViewControllerManager *)sharedManager {
	static WKViewControllerManager *instance = nil;
	static dispatch_once_t once;
	dispatch_once(&once, ^{
		instance = [[self alloc] init];
	});
	return instance;
}

- (void)setMainViewController:(UIViewController *)mainViewController {
	self.transitionController.mainViewController = mainViewController;
}

- (void)transitionControllerWithViewControllerModels:(NSArray<WKTransitioncChildControllerModel *> *)viewControllerModels {
	WKTransitionViewController *transitionController = [[WKTransitionViewController alloc] initWithChildViewControllerModels:viewControllerModels];
	self.transitionController = transitionController;
}


- (WKTransitionViewController *)transitionController {
	if (_transitionController == nil) {
		_transitionController = [[WKTransitionViewController alloc] init];
	}
	return _transitionController;
}

- (void)backToMainViewController {
	[self.transitionController backToMainViewController];
}

- (void)didSelectedAtIndex:(NSInteger)index {
	[self.transitionController didSelectedAtIndex:index];
}
@end
