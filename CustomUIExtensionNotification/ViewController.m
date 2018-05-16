//
//  ViewController.m
//  CustomUIExtensionNotification
//
//  Created by fengxin on 2018/5/16.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // UNNotificationExtensionDefaultContentHidden = YES  就是本身的通知内容 title  subtitle  body 不显示
    // UNNotificationExtensionDefaultContentHidden = NO   默认显示
}
- (IBAction)categoryLocalNotificationClickHandle:(id)sender {
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"这是title";
    content.subtitle = @"这是sutitle";
    content.body = @"这是body";
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = @"category1";
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
    UNNotificationAttachment *attach = [UNNotificationAttachment attachmentWithIdentifier:@"attachId" URL:url options:nil error:nil];
    if (attach)
    {
        content.attachments = @[attach];
    }
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requestId" content:content trigger:[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.0 repeats:NO]];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
