//
//  AppDelegate.h
//  RAATabbarController
//
//  Created by Raphael Araújo on 1/19/16.
//  Copyright © 2016 Raphael Araújo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CustomTabBarViewController *tabBarController;

@end

