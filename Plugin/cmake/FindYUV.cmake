set(CMAKE_PREFIX_PATH
    ../External/install/libyuv
)

find_path(YUV_INCLUDE_DIR
    libyuv.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(YUV_LIBRARY
    NAMES yuv
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(YUV_INCLUDE_DIR)
mark_as_advanced(YUV_LIBRARY)

find_package_handle_standard_args("YUV"
    DEFAULT_MSG
    YUV_LIBRARY
    YUV_INCLUDE_DIR
)
