# OTA assert
TARGET_OTA_ASSERT_DEVICE := P1M,Vibe_P1M,p1m,P1M,vibep1m,vibeP1m,P1m,P1ma40

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Configure jemalloc for low memory
MALLOC_SVELTE := true

BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
