set(CMAKE_PREFIX_PATH
    ../External/install/libflac
)

find_path(FLAC_INCLUDE_DIR
    FLAC/all.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(FLAC_LIBRARY
    NAMES FLAC
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(FLAC_INCLUDE_DIR)
mark_as_advanced(FLAC_LIBRARY)

find_package_handle_standard_args("FLAC"
    DEFAULT_MSG
    FLAC_LIBRARY
    FLAC_INCLUDE_DIR
)
