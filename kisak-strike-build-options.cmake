# Welcome to the Kisak-Strike options file
# Options here can be freely changed, however it is recommended to set the options via command line.
# Example: cmake .. -DUSE_ROCKETUI=1 -DUSE_KISAK_PHYSICS=1 -DDEDICATED=0



# UI Options
option(USE_ROCKETUI "Use New Open Source Kisak-Strike RmlUI" ON)
option(USE_SCALEFORM "Use In-Complete Proprietary Flash UI with blob ( Not Recommended )" OFF)
# There is also a 3rd option, which is nothing. Nothing will enable base VGUI UI which is also incomplete.

# DEDICATED Server
option(DEDICATED "Build as DEDICATED server. This is Separate from the main build and they are not in-tree compatible.
Make sure to build with -DDEDICATED=0 once you want a regular client again." OFF)

# Physics Options
option(USE_KISAK_PHYSICS "Use the Open Source Physics Re-Build made for kisak-strike from various leaked sources" ON)
option(USE_BULLET_PHYSICS "( NOT DONE )" OFF)
# 3rd option is to have both of these OFF, the closed source blob from Valve will be used instead.




# Kisak-Strike Developer Options
#ASAN - note that you cannot use GDB with ASAN because it uses ptrace
option(USE_ASAN "Enable the Address Sanitizer GCC plugin, used for finding memory errors/bugs" OFF)


#CMAKE_BUILD_TYPE is supported: RELEASE, DEBUG -- See source_posix_base.cmake for more compiler flags.