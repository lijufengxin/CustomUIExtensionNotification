//
//  NotificationViewController.m
//  extensionNotification
//
//  Created by fengxin on 2018/5/16.
//  Copyright © 2018年 fengxin. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>

@property (weak, nonatomic) IBOutlet UILabel *labelL;


@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.labelL.text = notification.request.content.body;
}

@end
