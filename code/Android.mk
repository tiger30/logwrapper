LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

# Build all java files in the java subdirectory
LOCAL_SRC_FILES := $(call all-subdir-java-files)

# The name of the jar file to create
LOCAL_MODULE := logwrapper

# Build a static jar file.
include $(BUILD_STATIC_JAVA_LIBRARY)


