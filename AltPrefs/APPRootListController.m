#include "APPRootListController.h"
#import <UIKit/UIKit.h>

@implementation APPRootListController

void ShowAlert(NSString *msg, NSString *title) {
	UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* dismissButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {}];

    [alert addAction:dismissButton];

    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:YES completion:nil];
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(instancetype)init {
	self = [super init];
  [self reloadPreferences:nil];

  return self;
}

-(void)syncSelectedApps {
  [self reloadPreferences:nil];
}

-(void)reloadPreferences:(NSNotification *)notification {
  NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:@"/var/jb/var/mobile/Library/Preferences/dev.und3fy.bfdecrypt_prefs.plist"];
  NSArray *includedApps = [prefs objectForKey:@"selectedApplications"];
  NSMutableArray *bundles = [[NSMutableArray alloc] init];

  for (NSString *key in includedApps) {
    [bundles addObject:key];
  }

  NSDictionary *filterDict = @{
    @"Filter": @{
      @"Bundles": bundles
    }
  };

  @try {
    [filterDict writeToFile:@"/var/jb/Library/MobileSubstrate/DynamicLibraries/bfdecrypt_fromprefs.plist" atomically:NO];
    [filterDict writeToFile:@"/var/jb/Library/MobileSubstrate/DynamicLibraries/bfdecrypt.plist" atomically:NO];
  }
  @catch(id anException) {
    NSLog(@"[bfdecryptPrefs] Error writing preferences");
    ShowAlert(@"Error writing preferences", @"Error");
  }
}

@end

