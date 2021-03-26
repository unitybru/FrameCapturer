set(CMAKE_PREFIX_PATH
    ../External/install/libopus
)

find_path(OPUS_INCLUDE_DIR
    opus/opus.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(OPUS_LIBRARY
    NAMES opus
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(OPUS_INCLUDE_DIR)
mark_as_advanced(OPUS_LIBRARY)

find_package_handle_standard_args("OPUS"
    DEFAULT_MSG
    OPUS_LIBRARY
    OPUS_INCLUDE_DIR
)
