#include "APPRootListController.h"

@implementation APPRootListController

void reloadPreferences()
{
	preferences = [NSDictionary dictionaryWithContentsOfFile:kAltListPrefsPlistPath];
	NSMutableArray *bundles = [[NSMutableArray alloc] init];

	// select preference from key in Root.plist
	selectedApplications = [preferences objectForKey:@"selectedApplications"]

	for (NSString *key in selectedApplications) {
		if ([[preferences objectForKey:key] boolValue] == YES) {
			[bundles addObject:key];
		}
	}

	NSDictionary *filterDict = @{
		@"Filter": @{
			@"Bundles": bundles
		}
	};

	@try
	{
		[filterDict writeToFile:@"/var/jb/Library/MobileSubstrate/DynamicLibraries/bfdecrypt_fromprefs.plist" atomically:NO];
		[filterDict writeToFile:@"/var/jb/Library/MobileSubstrate/DynamicLibraries/bfdecrypt.plist" atomically:NO];
	}
	@catch(id anException) {
		NSLog(@"[bfdecryptPrefs] Error writing preferences");
		ShowAlert(@"Error writing preferences", @"Error");
	}
}

- (void)syncSelectedApplications
{
	reloadPreferences();
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end

__attribute__((constructor))
static void init(void)
{
	reloadPreferences();
}