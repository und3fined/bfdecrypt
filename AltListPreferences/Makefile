TARGET := iphone:clang:12.4:7.0

include $(THEOS)/makefiles/common.mk

ARCHS = arm64

BUNDLE_NAME = AltListTestPreferences

AltListTestPreferences_FILES = APPRootListController.m
AltListTestPreferences_FRAMEWORKS = UIKit
AltListTestPreferences_PRIVATE_FRAMEWORKS = Preferences
# AltListTestPreferences_EXTRA_FRAMEWORKS = AltList
AltListTestPreferences_INSTALL_PATH = /Library/PreferenceBundles
AltListTestPreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk