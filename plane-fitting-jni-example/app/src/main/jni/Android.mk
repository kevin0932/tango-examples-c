# Copyright 2015 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)
PROJECT_ROOT_FROM_JNI := ../../../../..
PROJECT_ROOT := $(LOCAL_PATH)/$(PROJECT_ROOT_FROM_JNI)

include $(CLEAR_VARS)
LOCAL_MODULE := plane_fitting_jni_example
LOCAL_SHARED_LIBRARIES := tango_client_api tango_support_api
LOCAL_CFLAGS := -std=c++11
LOCAL_C_INCLUDES := $(PROJECT_ROOT)/tango-gl/include \
                    $(PROJECT_ROOT)/third-party/glm
LOCAL_SRC_FILES := jni_interface.cc \
                   plane_fitting.cc \
                   plane_fitting_application.cc \
                   point_cloud_renderer.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/bounding_box.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/camera.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/conversions.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/cube.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/drawable_object.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/mesh.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/shaders.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/transform.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/util.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/video_overlay.cpp
LOCAL_LDLIBS := -lGLESv2 -llog -L$(SYSROOT)/usr/lib
include $(BUILD_SHARED_LIBRARY)

$(call import-add-path,$(PROJECT_ROOT))
$(call import-module,tango_client_api)
$(call import-module,tango_support_api)
