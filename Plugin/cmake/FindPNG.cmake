set(CMAKE_PREFIX_PATH
    ../External/install/libpng
)

find_path(PNG_INCLUDE_DIR
    png.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)

find_library(PNG_LIBRARY
    NAMES png
    PATH_SUFFIXES
        lib/
    NO_CMAKE_SYSTEM_PATH
)

mark_as_advanced(PNG_INCLUDE_DIR)
mark_as_advanced(PNG_LIBRARY)

find_package_handle_standard_args("PNG"
    DEFAULT_MSG
    PNG_LIBRARY
    PNG_INCLUDE_DIR
)
