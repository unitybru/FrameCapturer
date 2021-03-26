set(CMAKE_PREFIX_PATH
    ../External/install/zlib
)

find_path(ZLIB_INCLUDE_DIR
    zlib.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(ZLIB_LIBRARY
    NAMES z
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(ZLIB_INCLUDE_DIR)
mark_as_advanced(ZLIB_LIBRARY)

find_package_handle_standard_args("ZLIB"
    DEFAULT_MSG
    ZLIB_LIBRARY
    ZLIB_INCLUDE_DIR
)
