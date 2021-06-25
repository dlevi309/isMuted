INSTALL_TARGET_PROCESSES = SpringBoard

export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = isMuted

isMuted_FILES = Tweak.x
isMuted_FRAMEWORKS = Foundation UIKit
isMuted_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
