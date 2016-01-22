//
//  CustomTabBarViewController.m
//  RAATabbarController
//
//  Created by Raphael Araújo on 1/19/16.
//  Copyright © 2016 Raphael Araújo. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface CustomTabBarViewController ()
@end

@implementation CustomTabBarViewController
FirstViewController *VC1;
SecondViewController *VC2;
ThirdViewController *VC3;
- (id)initWithButtons:(NSMutableArray *)buttons {
    self = [super init];
    
    if(self) {
        self.buttons = buttons;
        self.maxHeight = [self maxButtonHeight];
    }
        
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarController.tabBar setHidden:NO];
    NSMutableArray *buttons = [[NSMutableArray alloc] init];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    button1.backgroundColor = [UIColor blueColor];
    button1.selected = YES;
    [button1 setTitle:@"Tab 1" forState:UIControlStateNormal];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    button2.backgroundColor = [UIColor blackColor];
    [button2 setTitle:@"Tab 2" forState:UIControlStateNormal];
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 150)];
    button3.backgroundColor = [UIColor redColor];
    [button3 setTitle:@"Tab 3" forState:UIControlStateNormal];
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    button4.backgroundColor = [UIColor greenColor];
    [button4 setTitle:@"Tab 4" forState:UIControlStateNormal];
    UIButton *button5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 80)];
    button5.backgroundColor = [UIColor yellowColor];
    [button5 setTitle:@"Tab 5" forState:UIControlStateNormal];
    
    button1.tag = 0;
    button2.tag = 1;
    button3.tag = 2;
    button4.tag = 3;
    button5.tag = 4;
    
    [button1 addTarget:self action:@selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(buttonTapped:) forControlEvents: UIControlEventTouchUpInside];

    [buttons addObject:button1];
    [buttons addObject:button2];
    [buttons addObject:button3];
    [buttons addObject:button4];
    [buttons addObject:button5];
    [self setTabButtons:buttons];
    
  


    // Do any additional setup after loading the view.
}

- (void)buttonTapped:(UIButton *)button {
    NSLog(@"buttonTapped %d", button.tag);
    [self setSelectedIndex:button.tag];

}
- (void)viewDidAppear:(BOOL)animated {
    [self setSelectedIndex:2];
    NSLog(@"Controllers %d", [self.viewControllers count]);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)maxButtonHeight {
    CGFloat maxHeight = 0;
    for(UIButton *button in self.buttons) {
        if(button.frame.size.height  > maxHeight) {
            maxHeight = button.frame.size.height;
        }
    }
    return maxHeight;
}

- (CGFloat)maxButtonWidth {
    return SCREEN_WIDTH/([self.buttons count]);
}

- (void)setButtonBgColors:(UIColor *) color {
    for(UIButton *button in self.buttons) {
        [button setBackgroundColor:color];
    }
}
- (void)setButtonsWidth:(CGFloat )width {
    CGFloat lastX = 0;
    for(UIButton *button in self.buttons) {
        CGRect frame = CGRectMake(lastX, SCREEN_HEIGHT - button.frame.size.height, width, button.frame.size.height);
        button.frame = frame;
        lastX = frame.origin.x + width;
        [self.view addSubview:button];
    }
}

- (void)setTabButtons:(NSMutableArray *)buttons {
    self.buttons = buttons;
    self.maxHeight = [self maxButtonHeight];
    //self.tabbarView = [[UIView alloc] initWithFrame:(CGRectMake(0, SCREEN_HEIGHT - self.maxHeight, SCREEN_WIDTH, self.maxHeight))];
    self.tabbarView.backgroundColor = [UIColor clearColor];
    [self setButtonsWidth:[self maxButtonWidth]];
   // [self.view addSubview:self.tabbarView];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
