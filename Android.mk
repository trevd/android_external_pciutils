# Makefile to build pciutils

# store the upper level directory
# so it can be restored later
PCIUTILS_LOCAL_PATH := $(call my-dir)

# include subdirectories (e.g. for libpci)
include $(call all-subdir-makefiles)


INCLUDES = $(LOCAL_PATH)
INCLUDES += $(LOCAL_PATH)/lib
INCLUDES += $(LOCAL_PATH)/include/pci
#INCLUDES += bionic/libc/include
#INCLUDES += bionic/libc/arch-x86/include
#INCLUDES += bionic/libc/kernel/common
#INCLUDES += bionic/libc/kernel/arch-x86
#INCLUDES += bionic/libm/include

LOCAL_PATH := $(PCIUTILS_LOCAL_PATH)

# lspci
include $(CLEAR_VARS)
LOCAL_MODULE:= lspci
LOCAL_MODULE_TAGS:= debug
LOCAL_MODULE_PATH:= $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_SRC_FILES:= lspci.c common.c ls-caps.c ls-ecaps.c ls-kernel.c ls-map.c ls-tree.c ls-vpd.c
LOCAL_C_INCLUDES:= $(INCLUDES)
LOCAL_STATIC_LIBRARIES:= libpci_static
#include $(BUILD_EXECUTABLE)

# pci.ids
include $(CLEAR_VARS)
LOCAL_MODULE:= pci.ids
LOCAL_MODULE_CLASS:= ETC
LOCAL_MODULE_TAGS:= debug
LOCAL_MODULE_PATH:= $(TARGET_OUT_ETC)/pciutils
LOCAL_SRC_FILES:= pci.ids
include $(BUILD_PREBUILT)
