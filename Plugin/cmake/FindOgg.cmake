set(CMAKE_PREFIX_PATH
    ../External/install/libogg
)

find_path(OGG_INCLUDE_DIR
    ogg/ogg.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(OGG_LIBRARY
    NAMES ogg
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(OGG_INCLUDE_DIR)
mark_as_advanced(OGG_LIBRARY)

find_package_handle_standard_args("OGG"
    DEFAULT_MSG
    OGG_LIBRARY
    OGG_INCLUDE_DIR
)
