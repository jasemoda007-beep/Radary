ARCHS = arm64
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WessamVIP

# ⚙️ هذي الحركة تخلي السيرفر يبحث عن كل ملفات الكود بالواجهة وبالمجلدات تلقائياً
WessamVIP_FILES = $(wildcard *.mm) $(wildcard *.m) $(wildcard *.cpp) $(wildcard ImGui/*.cpp) $(wildcard ImGui/*.mm)

WessamVIP_FRAMEWORKS = UIKit Foundation CoreGraphics Metal MetalKit QuartzCore
WessamVIP_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -DNDEBUG
WessamVIP_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -IImGui

include $(THEOS_MAKE_PATH)/tweak.mk
