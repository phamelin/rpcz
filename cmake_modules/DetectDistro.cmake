#==============================================================================
# Detect Linux distribution
#
# Usage:
#
# include(DetectDistro)
# detect_distro(DISTRO_ID DISTRO_RELEASE DISTRO_DESC)
# message(STATUS "Distro is: ${DISTRO_DESC})
#
# This macro use the lsb_release utility to detect the Linux distribution.
# If the distro is successfully found, the arguments DISTRO_ID, DISTRO_RELEASE
# and DISTRO_DESC will be set.
#==============================================================================

macro(detect_distro DISTRO_ID DISTRO_RELEASE DISTRO_DESC)

    # Check existance of lsb_release executable
    find_program(LSB_RELEASE_EXE lsb_release)

    if(LSB_RELEASE_EXE AND (CMAKE_SYSTEM_NAME MATCHES "Linux"))
    
        execute_process(COMMAND "${LSB_RELEASE_EXE}" "-is"
                        TIMEOUT 4
                        OUTPUT_VARIABLE ${DISTRO_ID}
                        ERROR_QUIET
                        OUTPUT_STRIP_TRAILING_WHITESPACE)
        #message(STATUS "Linux distro is: ${${DISTRO_ID}}")
    
        execute_process(COMMAND "${LSB_RELEASE_EXE}" "-rs"
                        TIMEOUT 4
                        OUTPUT_VARIABLE ${DISTRO_RELEASE}
                        ERROR_QUIET
                        OUTPUT_STRIP_TRAILING_WHITESPACE)
        #message(STATUS "Linux distro release is: ${${DISTRO_RELEASE}}")
    
        execute_process(COMMAND "${LSB_RELEASE_EXE}" "-ds"
                        TIMEOUT 4
                        OUTPUT_VARIABLE ${DISTRO_DESC}
                        ERROR_QUIET
                        OUTPUT_STRIP_TRAILING_WHITESPACE)
        #message(STATUS "Linux distro release is: ${${DISTRO_DESC}}")
    
    endif()

endmacro()
