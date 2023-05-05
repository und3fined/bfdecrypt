TARGET := iphone:clang:12.4:7.0

include $(THEOS)/makefiles/common.mk

ARCHS = arm64

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bfPrefs.plist$(ECHO_END)