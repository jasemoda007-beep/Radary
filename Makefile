ARCHS = arm64
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WessamVIP
WessamVIP_FILES = Dolphins.mm module_tools.cpp ini_rw.cpp stb_image.cpp HeeeNoScreenShotView.m log.mm ImGui/imgui.cpp ImGui/imgui_draw.cpp ImGui/imgui_tables.cpp ImGui/imgui_widgets.cpp ImGui/imgui_impl_metal.mm
WessamVIP_FRAMEWORKS = UIKit Foundation CoreGraphics Metal MetalKit QuartzCore
WessamVIP_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -DNDEBUG
WessamVIP_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable

include $(THEOS_MAKE_PATH)/tweak.mk
