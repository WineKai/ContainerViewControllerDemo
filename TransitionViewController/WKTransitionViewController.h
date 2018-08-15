//
//  WKTransitionViewController.h
//  demo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 xiudan_wk. All rights reserved.
//

#define kScreenWidth UIScreen.mainScreen.bounds.size.width
#define kScreenHeight UIScreen.mainScreen.bounds.size.height
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WKViewControllerDirection) {
	WKViewControllerDirectionForward = 0,
	WKViewControllerDirectionReverse,
	WKViewControllerDirectionMoveDown,
	WKViewControllerDirectionMoveUp,
	WKViewControllerDirectionMainVC,  //MAINVC没动画  设置这个选项的viewcontroller就是默认的mainViewController
};


/**
 防止指定viewcontroller的时候没设置frame或者其他错误，限定都用这个model的数组来初始化
 */
@interface WKTransitioncChildControllerModel: NSObject

@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, assign) WKViewControllerDirection direction;
+ (instancetype)modelWithViewController:(UIViewController *)viewController direction:(WKViewControllerDirection)direction;
@end


@interface WKTransitionViewController : UIViewController
// 和WKViewControllerDirectionMainVC的效果一样，设置mainVC
@property (nonatomic, strong) UIViewController *mainViewController;
// 推荐使用下面的初始化指定数组
@property (nonatomic, copy) NSArray <WKTransitioncChildControllerModel *>*viewControllerModels;

/**
 初始化

 @param viewControllerModels 控制器model数组
 @return WKTransitionViewController
 */
- (instancetype)initWithChildViewControllerModels:(NSArray<WKTransitioncChildControllerModel *> *)viewControllerModels;

/**
 返回到mainviewcontroller
 */
- (void)backToMainViewController;

/**
 选择第几个viewcontroller

 @param index <#index description#>
 */
- (void)didSelectedAtIndex:(NSInteger)index;
@end
