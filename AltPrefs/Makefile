TARGET := iphone:clang:12.4:7.0

include $(THEOS)/makefiles/common.mk

ARCHS = arm64
BUNDLE_NAME = bfdecryptPrefs

bfdecryptPrefs_FILES = APPRootListController.m
bfdecryptPrefs_FRAMEWORKS = UIKit
bfdecryptPrefs_PRIVATE_FRAMEWORKS = Preferences
bfdecryptPrefs_EXTRA_FRAMEWORKS = AltList
bfdecryptPrefs_INSTALL_PATH = /Library/PreferenceBundles
bfdecryptPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bfdecryptPrefs.plist$(ECHO_END)