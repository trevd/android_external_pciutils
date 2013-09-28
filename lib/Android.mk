# Android build file

LOCAL_PATH := $(call my-dir)

INCLUDES = $(LOCAL_PATH)
INCLUDES += $(LOCAL_PATH)/../include/pci
INCLUDES += bionic/libc/include
INCLUDES += bionic/libc/arch-x86/include
INCLUDES += bionic/libc/kernel/common
INCLUDES += bionic/libc/kernel/arch-x86
INCLUDES += bionic/libm/include

LIBNL_OBJ = init.c
LIBNL_OBJ += access.c
LIBNL_OBJ += params.c
LIBNL_OBJ += proc.c
LIBNL_OBJ += sysfs.c
LIBNL_OBJ += generic.c
LIBNL_OBJ += dump.c
LIBNL_OBJ += names.c
LIBNL_OBJ += names-cache.c
LIBNL_OBJ += names-hash.c
LIBNL_OBJ += names-net.c
LIBNL_OBJ += names-parse.c
LIBNL_OBJ += filter.c
LIBNL_OBJ += caps.c

ifdef CONFIG_ANDROID_LOG
L_CFLAGS += -DCONFIG_ANDROID_LOG
endif

include $(CLEAR_VARS)
LOCAL_MODULE = libpci_static
LOCAL_MODULE_TAGS := debug
LOCAL_CFLAGS = $(L_CFLAGS)
LOCAL_SRC_FILES = $(LIBNL_OBJ)
LOCAL_C_INCLUDES = $(INCLUDES)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE = libpci
LOCAL_MODULE_TAGS := debug
LOCAL_CFLAGS = $(L_CFLAGS)
LOCAL_SRC_FILES = $(LIBNL_OBJ)
LOCAL_C_INCLUDES = $(INCLUDES)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
# LOCAL_MODULE = pciutils
LOCAL_MODULE = libpci
LOCAL_MODULE_TAGS := debug
LOCAL_CFLAGS = $(L_CFLAGS)
LOCAL_SRC_FILES = $(LIBNL_OBJ)
LOCAL_C_INCLUDES = $(INCLUDES)
#include $(BUILD_HOST_SHARED_LIBRARY)

