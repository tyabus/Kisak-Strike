#//-----------------------------------------------------------------------------
#//	VGUIMATSURFACE.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.16)
project(vguimatsurface_client)
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTBINNAME "vguimatsurface_client")
set(OUTBINDIR ${SRCDIR}/../game/bin)

#set(NOSTINKYLINKIES "1") #this project requires precise linking

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)

include_directories(../public/mathlib)

if( LINUXALL )
    include_directories(/usr/include/freetype2)
endif()
add_definitions(-DBENCHMARK -DVGUIMATSURFACE_DLL_EXPORT -DGAMEUI_EXPORTS -DDONT_PROTECT_FILEIO_FUNCTIONS -DPROTECTED_THINGS_ENABLE)
add_definitions(-DENABLE_CHROMEHTMLWINDOW)

target_sources(${OUTBINNAME} PRIVATE "Clip2D.cpp")
target_sources(${OUTBINNAME} PRIVATE "Cursor.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "Input.cpp")
target_sources(${OUTBINNAME} PRIVATE "MatSystemSurface.cpp")
#File from mathlib.. fuck it, this single file won't link for some reason. It is a very simple file, so i'm duplicating it here.
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/mathlib/halton.cpp")

if( WIN32 )
	target_sources(${OUTBINNAME} PRIVATE "memorybitmap.cpp")
    #$File	"memorybitmap.cpp"						[$WINDOWS]
    #$File	"$SRCDIR\vgui2\src\htmlwindow.cpp"		[$WINDOWS]
endif()
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/vgui2/src/vgui_key_translation.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vgui_controls/vgui_controls.cpp")

target_link_libraries(${OUTBINNAME} vgui_controls_client vgui_surfacelib_client dmxloader_client tier2_client tier3_client mathlib_client bitmap_client libtier0_client vstdlib_client )

if( LINUXALL )
    target_link_libraries(${OUTBINNAME} fontconfig freetype SDL2)
endif()
