//
//  AppDelegate.m
//  TransitionViewControllerDemo
//
//  Created by xiudan_wk on 2018/8/15.
//  Copyright © 2018 WineKai. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"
#import "WKViewControllerManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	WKTransitioncChildControllerModel *leftModel = [WKTransitioncChildControllerModel modelWithViewController:[TestOneViewController new] direction:WKViewControllerDirectionForward];
	WKTransitioncChildControllerModel *rightModel = [WKTransitioncChildControllerModel modelWithViewController:[TestTwoViewController new] direction:WKViewControllerDirectionReverse];
	WKTransitioncChildControllerModel *mainModel = [WKTransitioncChildControllerModel modelWithViewController:[ViewController new] direction:WKViewControllerDirectionMainVC];
	
	//	[[WKViewControllerManager sharedManager] transitionControllerWithViewControllerModels:@[leftModel, rightModel,mainModel]];
	// 下面两行的效果和上面一行是一样的。
	[[WKViewControllerManager sharedManager] transitionControllerWithViewControllerModels:@[leftModel, rightModel]];
	[WKViewControllerManager sharedManager].mainViewController = mainModel.viewController;
	
	UIScreen *mainScreen = [UIScreen mainScreen];
	_window = [[UIWindow alloc] initWithFrame:mainScreen.bounds];
	[_window setBackgroundColor:UIColor.blackColor];
	_window.rootViewController = [WKViewControllerManager sharedManager].transitionController;
	[_window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
