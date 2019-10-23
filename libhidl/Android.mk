#
# Copyright (C) 2017 The LineageOS Project
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

#
# Copyright (C) 2017 The LineageOS Project
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

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libhidltransport
LOCAL_MODULE := android.hidl.base@1.0
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libhidltransport
LOCAL_MODULE := android.hidl.manager@1.0
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libhidltransport
LOCAL_MODULE := android.hidl.base@1.0_system
LOCAL_INSTALLED_MODULE_STEM := android.hidl.base@1.0.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := libhidltransport
LOCAL_MODULE := android.hidl.manager@1.0_system
LOCAL_INSTALLED_MODULE_STEM := android.hidl.manager@1.0.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
IMS_CAMERA_SYMLINK := $(TARGET_OUT)/priv-app/ims/lib/arm64/libimscamera_jni.so
$(IMS_CAMERA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Create ims camera jni link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/libimscamera_jni.so $@

include $(CLEAR_VARS)
IMS_MEDIA_SYMLINK := $(TARGET_OUT)/priv-app/ims/lib/arm64/libimsmedia_jni.so
$(IMS_MEDIA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Create ims media jni link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/libimsmedia_jni.so $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(IMS_CAMERA_SYMLINK) \
	$(IMS_MEDIA_SYMLINK)
