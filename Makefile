ARCHS = arm64 

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
THEOS_PACKAGE_SCHEME = rootless

# HATA ÇÖZÜMÜ: 'export THEOS=/Users/mute/theos' satırı silindi.
# GitHub, Theos'u kendi ortamına kuruyor ve $(THEOS) değişkenine atıyor.

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Dolphins

Dolphins_FRAMEWORKS = IOKit UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController

# JRMemory bağlantısı geri eklendi. 
# Framework'ün projenizin ana dizininde 'JRMemory.framework' adıyla olduğundan emin olun.
Dolphins_LDFLAGS += -F. -framework JRMemory

# Derleyici ayarları (C++ standartı gnu++17'ye güncellendi)
Dolphins_CCFLAGS = -w -std=gnu++17 -fno-rtti -fno-exceptions -DNDEBUG -Wno-module-import-in-extern-c
Dolphins_CFLAGS = -w -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -I./AFNetworking -I./CocoaAsyncSocket -I./Core -I./Core/Categories -I./Core/Mime -I./Core/Responses -I./EasyAES -I./MBProgressHUD -I./SAMKeychain -I./SCLAlertView -I./UDID

# Projedeki dosyalar (Aynen korundu)
Dolphins_FILES =  $(wildcard AFNetworking/*.m) $(wildcard CocoaAsyncSocket/*.m) $(wildcard Core/*.m) $(wildcard Core/Categories/*.m) $(wildcard Core/Mine/*.m) $(wildcard Core/Responses/*.m) $(wildcard SAMKeychain/*.m) $(wildcard Core/Responses/*.m) $(wildcard EasyAES/*.m) $(wildcard MBProgressHUD/*.m) $(wildcard UDID/*.mm) Engine.mm  $(wildcard View/*.mm) $(wildcard CustomView/*.m) $(wildcard utils/*.cpp) $(wildcard utils/*.m) $(wildcard imgui/*.mm) $(wildcard imgui/*.cpp)  $(wildcard ESP/*.mm) $(wildcard ESP/*.cpp) $(wildcard authcheatbot/*.m) $(wildcard SDK/*.cpp) $(wildcard fang/*.m) 

include $(THEOS_MAKE_PATH)/tweak.mk
