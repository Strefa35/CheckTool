# - Try to find NxClient
#
# Once done this will define
#  LIBNXCLIENT_FOUND           - System has the component
#  LIBNXCLIENT_INCLUDE_DIRS    - Component include directories
#  LIBNXCLIENT_LIBRARIES       - Libraries needed to use the component

find_path(LIBNXCLIENT_INCLUDE_DIR
          NAMES nxclient.h
          HINTS ${PC_LIBNXCLIENT_INCLUDEDIR} ${PC_LIBNXCLIENT_INCLUDE_DIRS}
          )

find_library(LIBNXCLIENT_LIBRARY
             NAMES nxclient
             HINTS ${PC_LIBNXCLIENT_INCLUDEDIR} ${PC_LIBNXCLIENT_INCLUDE_DIRS}
             )

message(STATUS "LIBNXCLIENT_INCLUDE_DIR = ${LIBNXCLIENT_INCLUDE_DIR}")
message(STATUS "LIBNXCLIENT_LIBRARY     = ${LIBNXCLIENT_LIBRARY}")

# handle the QUIETLY and REQUIRED arguments and set component to TRUE
# if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibNxClient DEFAULT_MSG
                                  LIBNXCLIENT_LIBRARY
                                  LIBNXCLIENT_INCLUDE_DIR)

mark_as_advanced(LIBNXCLIENT_INCLUDE_DIR LIBNXCLIENT_LIBRARY)

set(LIBNXCLIENT_INCLUDE_DIRS ${LIBNXCLIENT_INCLUDE_DIR})
set(LIBNXCLIENT_LIBRARIES ${LIBNXCLIENT_LIBRARY})
