//
//  AppDelegate.m
//  WxxMain
//
//  Created by Cassie on 2019/10/10.
//  Copyright © 2019 Cassie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = UIColor.whiteColor;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window.rootViewController = navigationController;
    [_window makeKeyAndVisible];
    return YES;
}




@end
