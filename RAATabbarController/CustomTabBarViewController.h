//
//  CustomTabBarViewController.h
//  RAATabbarController
//
//  Created by Raphael Araújo on 1/19/16.
//  Copyright © 2016 Raphael Araújo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface CustomTabBarViewController : UITabBarController {

}
@property (strong, nonatomic) UIView *tabbarView;
@property (strong, nonatomic) NSMutableArray *buttons;
@property CGFloat maxHeight;
@property CGFloat maxWidth;

- (void)setTabButtons:(NSMutableArray *)buttons;
@end
