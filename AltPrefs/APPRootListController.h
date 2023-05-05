#import <Preferences/PSListController.h>
#import <UIKit/UIKit.h>

@interface APPRootListController : PSListController
-(void)syncSelectedApps;
-(void)reloadPreferences:(NSNotification *)notification;
@end