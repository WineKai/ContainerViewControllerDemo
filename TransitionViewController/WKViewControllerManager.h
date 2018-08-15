//
//  WKViewControllerManager.h
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKTransitionViewController.h"

@interface WKViewControllerManager : NSObject
@property (nonatomic, strong, readonly) WKTransitionViewController *transitionController;

@property (nonatomic, strong) UIViewController *mainViewController;
+ (WKViewControllerManager *)sharedManager;

/**
 初始化一个WKTransitionViewController

 @param viewControllerModels 包含的子控制器数组
 */
- (void)transitionControllerWithViewControllerModels:(NSArray <WKTransitioncChildControllerModel *> *)viewControllerModels;


/**
 返回到mainviewcontroller
 */
- (void)backToMainViewController;

/**
 选择了第几个控制器
 
这个index是依据创建时传入的数组顺序，如果数组里包含mainViewcontroller,点击切换到
 mainviewcontroller的index会无效。

 @param index 控制器序号
 */
- (void)didSelectedAtIndex:(NSInteger)index;
@end
