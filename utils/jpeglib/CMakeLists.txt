#//-----------------------------------------------------------------------------
#//	JPEGLIB.VPC
#//
#//	Project Script
#//-----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.16)
project(jpeglib_client C) #set as C proj
set(SRCDIR "${CMAKE_SOURCE_DIR}")
set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
set(OUTLIBNAME "jpeglib_client")

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_lib_base.cmake)

include_directories(${SRCDIR}/public/jpeglib)
add_definitions(-DSTRICT)

if( POSIX )
    target_compile_options(${OUTLIBNAME} PRIVATE -fpic -fno-semantic-interposition)
endif()
if( NOT LINUXALL )
#$CompileAs							"Compile as C Code (/TC)" [!$LINUXALL]
endif()

target_sources(${OUTLIBNAME} PRIVATE "jaricom.c")
target_sources(${OUTLIBNAME} PRIVATE "jcapimin.c")
target_sources(${OUTLIBNAME} PRIVATE "jcapistd.c")
target_sources(${OUTLIBNAME} PRIVATE "jcarith.c")
target_sources(${OUTLIBNAME} PRIVATE "jccoefct.c")
target_sources(${OUTLIBNAME} PRIVATE "jccolor.c")
target_sources(${OUTLIBNAME} PRIVATE "jcdctmgr.c")
target_sources(${OUTLIBNAME} PRIVATE "jchuff.c")
target_sources(${OUTLIBNAME} PRIVATE "jcinit.c")
target_sources(${OUTLIBNAME} PRIVATE "jcmainct.c")
target_sources(${OUTLIBNAME} PRIVATE "jcmarker.c")
target_sources(${OUTLIBNAME} PRIVATE "jcmaster.c")
target_sources(${OUTLIBNAME} PRIVATE "jcomapi.c")
target_sources(${OUTLIBNAME} PRIVATE "jcparam.c")
target_sources(${OUTLIBNAME} PRIVATE "jcprepct.c")
target_sources(${OUTLIBNAME} PRIVATE "jcsample.c")
target_sources(${OUTLIBNAME} PRIVATE "jctrans.c")
target_sources(${OUTLIBNAME} PRIVATE "jdapimin.c")
target_sources(${OUTLIBNAME} PRIVATE "jdapistd.c")
target_sources(${OUTLIBNAME} PRIVATE "jdarith.c")
target_sources(${OUTLIBNAME} PRIVATE "jdatadst.c")
target_sources(${OUTLIBNAME} PRIVATE "jdatasrc.c")
target_sources(${OUTLIBNAME} PRIVATE "jdcoefct.c")
target_sources(${OUTLIBNAME} PRIVATE "jdcolor.c")
target_sources(${OUTLIBNAME} PRIVATE "jddctmgr.c")
target_sources(${OUTLIBNAME} PRIVATE "jdhuff.c")
target_sources(${OUTLIBNAME} PRIVATE "jdinput.c")
target_sources(${OUTLIBNAME} PRIVATE "jdmainct.c")
target_sources(${OUTLIBNAME} PRIVATE "jdmarker.c")
target_sources(${OUTLIBNAME} PRIVATE "jdmaster.c")
target_sources(${OUTLIBNAME} PRIVATE "jdmerge.c")
target_sources(${OUTLIBNAME} PRIVATE "jdpostct.c")
target_sources(${OUTLIBNAME} PRIVATE "jdsample.c")
target_sources(${OUTLIBNAME} PRIVATE "jdtrans.c")
target_sources(${OUTLIBNAME} PRIVATE "jerror.c")
target_sources(${OUTLIBNAME} PRIVATE "jfdctflt.c")
target_sources(${OUTLIBNAME} PRIVATE "jfdctfst.c")
target_sources(${OUTLIBNAME} PRIVATE "jfdctint.c")
target_sources(${OUTLIBNAME} PRIVATE "jidctflt.c")
target_sources(${OUTLIBNAME} PRIVATE "jidctfst.c")
target_sources(${OUTLIBNAME} PRIVATE "jidctint.c")
target_sources(${OUTLIBNAME} PRIVATE "jmemmgr.c")
target_sources(${OUTLIBNAME} PRIVATE "jmemnobs.c")
target_sources(${OUTLIBNAME} PRIVATE "jquant1.c")
target_sources(${OUTLIBNAME} PRIVATE "jquant2.c")
target_sources(${OUTLIBNAME} PRIVATE "jutils.c")