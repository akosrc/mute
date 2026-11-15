ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mute

# Frameworkler
Mute_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController WebKit Metal MetalKit

# JRMemory Framework Bağlantısı
Mute_LDFLAGS += -F. -framework JRMemory

# Derleyici Ayarları
Mute_CCFLAGS = -w -std=gnu++17 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c
Mute_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

# Arama Yolları (Tüm klasörler eklendi)
Mute_CFLAGS += -I. -I./API -I./CustomView -I./ESP -I./Image -I./JRMemory.framework -I./KittyMemory -I./View -I./imgui -I./lib -I./utils

# Projedeki Tüm Dosyalar
# DİKKAT: KittyMemory altında sadece .cpp dosyalarını alıyoruz, .hpp'leri almıyoruz.
Mute_FILES = main.cpp Engine.mm ini_rw.cpp \
             $(wildcard API/*.m) $(wildcard API/*.mm) \
             $(wildcard CustomView/*.m) $(wildcard CustomView/*.mm) \
             $(wildcard ESP/*.mm) $(wildcard ESP/*.cpp) \
             $(wildcard View/*.mm) $(wildcard View/*.m) \
             $(wildcard imgui/*.mm) $(wildcard imgui/*.cpp) \
             $(wildcard utils/*.cpp) $(wildcard utils/*.m) \
             $(wildcard KittyMemory/*.cpp)

include $(THEOS)/makefiles/tweak.mk
