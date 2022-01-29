#.rst:
# FindGSSAPI
# -------
# Finds the gssapi library
#
# This will will define the following variables::
#
# GSSAPI_FOUND - system has gssapi
# GSSAPI_INCLUDE_DIRS - the gssapi include directory
# GSSAPI_LIBRARIES - the gssapi libraries

if (WIN32 AND HAVE_MIT_KERBEROS)
    if (CMAKE_CL_64)
        find_library(GSSAPI_LIBRARY1 NAMES gssapi64)
        find_library(GSSAPI_LIBRARY2 NAMES krb5_64)
    else ()
        find_library(GSSAPI_LIBRARY1 NAMES gssapi32)
        find_library(GSSAPI_LIBRARY2 NAMES krb5_32)
    endif ()
    if (GSSAPI_LIBRARY1 AND GSSAPI_LIBRARY2)
        set(GSSAPI_LIBRARY ${GSSAPI_LIBRARY1} ${GSSAPI_LIBRARY2})
    endif ()
else ()
    find_library(GSSAPI_LIBRARY NAMES gssapi_krb5)
endif ()

find_path(GSSAPI_INCLUDE_DIR NAMES gssapi.h
                                   gssapi/gssapi.h)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GSSAPI
                                  REQUIRED_VARS GSSAPI_LIBRARY GSSAPI_INCLUDE_DIR)

if (GSSAPI_LIBRARY AND GSSAPI_INCLUDE_DIRS)
  set(GSSAPI_FOUND TRUE)
endif ()

if(GSSAPI_FOUND)
  set(GSSAPI_LIBRARIES ${GSSAPI_LIBRARY})
  set(GSSAPI_INCLUDE_DIRS ${GSSAPI_INCLUDE_DIR})
endif()

mark_as_advanced(GSSAPI_LIBRARIES GSSAPI_INCLUDE_DIRS)
