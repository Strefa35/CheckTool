# - Try to find Nexus
#
# Once done this will define
#  LIBNEXUS_FOUND           - System has the component
#  LIBNEXUS_INCLUDE_DIRS    - Component include directories
#  LIBNEXUS_LIBRARIES       - Libraries needed to use the component

find_path(LIBNEXUS_INCLUDE_DIR
          NAMES nexus.h
          PATH_SUFFIXES nexus
          HINTS ${PC_LIBNEXUS_INCLUDEDIR} ${PC_LIBNEXUS_INCLUDE_DIRS}
          )

find_library(LIBNEXUS_LIBRARY
             NAMES nexus
             HINTS ${PC_LIBNEXUS_INCLUDEDIR} ${PC_LIBNEXUS_INCLUDE_DIRS}
             )

message(STATUS "LIBNEXUS_INCLUDE_DIR = ${LIBNEXUS_INCLUDE_DIR}")
message(STATUS "LIBNEXUS_LIBRARY     = ${LIBNEXUS_LIBRARY}")

# handle the QUIETLY and REQUIRED arguments and set component to TRUE
# if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibNexus DEFAULT_MSG
                                  LIBNEXUS_LIBRARY
                                  LIBNEXUS_INCLUDE_DIR)

mark_as_advanced(LIBNEXUS_INCLUDE_DIR LIBNEXUS_LIBRARY)

set(LIBNEXUS_INCLUDE_DIRS ${LIBNEXUS_INCLUDE_DIR})
set(LIBNEXUS_LIBRARIES ${LIBNEXUS_LIBRARY})
