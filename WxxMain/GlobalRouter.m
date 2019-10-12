//
//  GlobalRouter.m
//  WxxMain
//
//  Created by Cassie on 2019/10/11.
//  Copyright © 2019 Cassie. All rights reserved.
//

#import "GlobalRouter.h"
#import <MGJRouter/MGJRouter.h>
#import <WxxModuleA/AViewController.h>



@implementation GlobalRouter

+ (void)load {
    /* Hard code register*/
    /*
   [MGJRouter registerURLPattern:@"wxx://moduleA" toHandler:^(NSDictionary *routerParameters) {
       UINavigationController *navigationVC = (UINavigationController *) [UIApplication sharedApplication].delegate.window.rootViewController;
       AViewController *vc = [[AViewController alloc] init];
       [navigationVC pushViewController:vc animated:YES];
    }];
     */
    
    // Using mapping plist
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"RouterMapping" ofType:@"plist"];
    NSArray *mappingArray = [NSArray arrayWithContentsOfFile:bundlePath];
    [mappingArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *url = obj[@"url"];
        NSString *className = obj[@"rootVCName"];
        [MGJRouter registerURLPattern:url toHandler:^(NSDictionary *routerParameters) {
            UINavigationController *navigationVC = (UINavigationController *) [UIApplication sharedApplication].delegate.window.rootViewController;
            UIViewController *vc = [[NSClassFromString(className) alloc] init];
            [navigationVC pushViewController:vc animated:YES];
        }];
    }];
    
    
}
@end
