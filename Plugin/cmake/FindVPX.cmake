set(LIBRARY_PATHS
    # path for include files
    ../External/libvpx
    # path for compiled library
    ../External/libvpx-build
)

find_path(VPX_INCLUDE_DIR
    vpx/vpx_codec.h
    PATHS ${VPX_DIR}/include
)

find_library(VPX_LIBRARY
    NAMES vpx
    PATHS ${LIBRARY_PATHS}
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(VPX_INCLUDE_DIR)
mark_as_advanced(VPX_LIBRARY)

find_package_handle_standard_args("VPX"
    DEFAULT_MSG
    VPX_LIBRARY
    VPX_INCLUDE_DIR
)
