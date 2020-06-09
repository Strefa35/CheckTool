cmake_minimum_required(VERSION 3.2)

project(CheckTool
    VERSION 0.0.1
)

#
# Directory with modules
#
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/")


#
# Configuration variables
#
option(INSTALL_HEADERS "Install the headers" OFF)
option(INSTALL_CLIENT "Install the Client" OFF)


#
# Packages to use
#

# Broadcom's platform
find_package(LibNexus)
find_package(LibNxClient)


# others packages
#find_package(LibGlib REQUIRED)
#find_package(LibGio REQUIRED)
#find_package(LibGioUnix)
#find_package(LibGObject REQUIRED)
#find_package(LibJsonCpp REQUIRED)
find_package(Threads REQUIRED)

#
# Targets
#
# Link all DAL's library together between -Wl,--whole-archive ${DAL_LIB_LIST} -Wl,--no-whole-archive
add_executable(CheckTool
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

target_compile_features(CheckTool
  PRIVATE
    cxx_std_11
)


#
# Include directories
#
target_include_directories(CheckTool
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

if (${LIBNEXUS_FOUND})
  #include_directories(${LIBNEXUS_INCLUDE_DIRS})
  target_include_directories(CheckTool
    PRIVATE
      ${LIBNEXUS_INCLUDE_DIRS}
  )
endif (${LIBNEXUS_FOUND})

if (${LIBNXCLIENT_FOUND})
  #include_directories(${LIBNXCLIENT_INCLUDE_DIRS})
  target_include_directories(CheckTool
    PRIVATE
      ${LIBNXCLIENT_INCLUDE_DIRS}
  )
endif (${LIBNXCLIENT_FOUND})


if(${LIBNEXUS_FOUND})
  target_link_libraries(CheckTool ${LIBNEXUS_LIBRARIES})
endif(${LIBNEXUS_FOUND})

if(${LIBNXCLIENT_FOUND})
  target_link_libraries(CheckTool ${LIBNXCLIENT_LIBRARIES})
endif(${LIBNXCLIENT_FOUND})

