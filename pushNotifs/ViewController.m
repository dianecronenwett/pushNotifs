//
//  ViewController.m
//  pushNotifs
//
//  Created by Diane Garcia on 11/21/15.
//  Copyright © 2015 Diane Cronenwett. All rights reserved.
//

#import "ViewController.h"
@import UIKit;
@interface ViewController ()

- (void) requestPermissionToNotify;
- (void) createNotification:(int)secondsInTheFuture;


@end


@implementation ViewController


- (IBAction)scheduleTapped:(id)sender {
        [self requestPermissionToNotify];
        [self createNotification:5];
    }



- (void) requestPermissionToNotify{
    
    UIMutableUserNotificationAction *floatAction = [[UIMutableUserNotificationAction alloc] init];
    
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title = @"float";
    floatAction.activationMode = UIUserNotificationActivationModeBackground;
    floatAction.destructive = YES;
    floatAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *stingAction = [[UIMutableUserNotificationAction alloc] init];
    
    stingAction.identifier = @"STING_ACTION";
    stingAction.title = @"sting";
    stingAction.activationMode = UIUserNotificationActivationModeForeground;
    stingAction.destructive = NO;
    stingAction.authenticationRequired = NO;
    
    
    UIMutableUserNotificationCategory *responseCategory = [[UIMutableUserNotificationCategory alloc] init];
    responseCategory.identifier = @"MAIN_CATEGORY";
    [responseCategory setActions: @[floatAction,stingAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:responseCategory, nil];
    
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}


- (void) createNotification:(int)secondsInTheFuture{
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    localNotif.timeZone = nil;
    
    localNotif.alertTitle =@"Hi!";
    localNotif.alertBody =@"close this";
    localNotif.alertAction =@"close";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    localNotif.applicationIconBadgeNumber = 4;
    
    localNotif.category = @"MAIN_CATEGORY";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)] CGPath]];
    
    
    [[self.view layer] addSublayer:circleLayer];
    
    [circleLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    
    circleLayer.position = CGPointMake(55,220);

    
    }
   
   



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
