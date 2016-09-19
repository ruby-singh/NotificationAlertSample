//
//  ViewController.m
//  PushyApp
//
//  Created by Ruby on 2/8/16.
//  Copyright © 2016 Hello World Organisation. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void) requestPermissionToNotify;
-(void) createNotification:(int) secondsInFuture;

@end

@implementation ViewController
- (IBAction)scheduleTapped:(id)sender {
    [self requestPermissionToNotify];
    [self createNotification:5];
}

-(void) requestPermissionToNotify{
    
    UIMutableUserNotificationAction *floatAction = [[UIMutableUserNotificationAction alloc] init];
    floatAction.identifier = @"FLOAT_ACTION";
    floatAction.title=@"Float";
    floatAction.activationMode=UIUserNotificationActivationModeBackground;
    floatAction.destructive =YES;
    floatAction.authenticationRequired=NO;
    
    
    UIMutableUserNotificationAction *stingAction = [[UIMutableUserNotificationAction alloc] init];
    stingAction.identifier = @"STING_ACTION";
    stingAction.title=@"Sting";
    stingAction.activationMode=UIUserNotificationActivationModeForeground;
    stingAction.destructive =NO;
    stingAction.authenticationRequired=NO;
    
    UIMutableUserNotificationCategory *responsecategory = [[UIMutableUserNotificationCategory alloc] init];
    responsecategory.identifier=@"MAIN_CATEGORY";
    [responsecategory setActions:@[floatAction,stingAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:responsecategory, nil];
 
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings =  [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
}

-(void) createNotification:(int) secondsInFuture{
    
    UILocalNotification *localNotify = [[UILocalNotification alloc] init];
    localNotify.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInFuture];
    localNotify.timeZone = nil;
    localNotify.alertTitle = @"Alert Title";
    localNotify.alertBody = @"This is alert Body";
    localNotify.alertAction = @"Okay";
    localNotify.soundName = UILocalNotificationDefaultSoundName;
    localNotify.applicationIconBadgeNumber = 4123;
    //localNotify.category=@"MAIN_CATEGORY";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotify];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
