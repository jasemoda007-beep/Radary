ARCHS = arm64
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WessamVIP

# 1. ملفات الكود للترجمة (Dolphins.mm مع البحث التلقائي بداخل المجلدات)
WessamVIP_FILES = Dolphins.mm \
                  $(wildcard imgui/*.cpp) $(wildcard imgui/*.mm) \
                  $(wildcard Module/*.cpp) $(wildcard Module/*.mm) \
                  $(wildcard lib/*.cpp) $(wildcard lib/*.mm) \
                  $(wildcard utils/*.cpp) $(wildcard utils/*.mm) \
                  $(wildcard View/*.m) $(wildcard View/*.mm)

# 2. أطر العمل الأساسية
WessamVIP_FRAMEWORKS = UIKit Foundation CoreGraphics Metal MetalKit QuartzCore

# 3. إعدادات البحث عن الملفات (هنا ضفنا المجلدات حتى يقرأ الـ .h بداخلها)
WessamVIP_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable \
                   -Iimgui -IModule -Ilib -Iutils -IView -I.

WessamVIP_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -DNDEBUG

include $(THEOS_MAKE_PATH)/tweak.mk
