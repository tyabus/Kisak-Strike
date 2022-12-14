project(rocketui_client)
cmake_minimum_required(VERSION 3.16)

set(SRCDIR "${CMAKE_CURRENT_SOURCE_DIR}/../")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINDIR ${SRCDIR}/../game/bin)
set(OUTBINNAME "rocketui_client")
#set(DONT_DOWNGRADE_ABI "1")

#dont need to build this when building dedicated server
if( DEDICATED )
    return()
endif()

include_directories(${SRCDIR}/thirdparty/RmlUi/Include)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

target_sources(${OUTBINNAME} PRIVATE rocketuiimpl.cpp)
target_sources(${OUTBINNAME} PRIVATE rocketsystem.cpp)
target_sources(${OUTBINNAME} PRIVATE rocketfilesystem.cpp)

#Custom Elements
target_sources(${OUTBINNAME} PRIVATE customelements/KisakConvarSetting.cpp)
target_sources(${OUTBINNAME} PRIVATE customelements/KisakURL.cpp)

if( POSIX )
    #OpenGL rendering imp
    target_sources(${OUTBINNAME} PRIVATE rocketrenderGL.cpp)
    target_link_libraries(${OUTBINNAME} SDL2)
else()
    message(FATAL_ERROR "not implemented for windows")
endif()

#target_link_libraries(${OUTBINNAME} ${SRCDIR}/thirdparty/RmlUi/build/libRmlCore.so)
target_link_libraries(${OUTBINNAME} RmlCore RmlDebugger) #thirdparty/RmlUI

#target_link_libraries(${OUTBINNAME} ${SRCDIR}/thirdparty/RmlUi/build/libRmlDebugger.so)
target_link_libraries(${OUTBINNAME} GL tier2_client tier3_client libtogl_client)