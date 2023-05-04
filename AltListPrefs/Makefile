TARGET := iphone:clang:12.4:7.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AltListPrefs

AltListPrefs_FILES = APPRootListController.m
AltListPrefs_FRAMEWORKS = UIKit
AltListPrefs_PRIVATE_FRAMEWORKS = Preferences
AltListPrefs_INSTALL_PATH = /var/jb/Library/PreferenceBundles
AltListPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk