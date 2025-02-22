# do not rename this or change path
DEVICE_PACKAGE_OVERLAYS += vendor/custom/vendor/overlay/common

# MicroG
PRODUCT_PACKAGES += \
    GmsCore \
    GsfProxy \
    FakeStore \
    com.google.android.maps.jar

# Seedvault
PRODUCT_PACKAGES += \
    Seedvault

# Add back 2 buttons navigation overlay & android auto stub
PRODUCT_PACKAGES += \
    AndroidAuto \
    NavigationBarMode2ButtonOverlay

# Aurora
PRODUCT_PACKAGES += \
    AuroraServices \
    AuroraStore
    
# Fix for Google Camera
PRODUCT_COPY_FILES += \
	vendor/custom/prebuilt/google_experience.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google_experience.xml
