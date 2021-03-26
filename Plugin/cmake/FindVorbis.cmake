set(CMAKE_PREFIX_PATH
    ../External/install/libvorbis
)

find_path(VORBIS_INCLUDE_DIR
    vorbis/codec.h
    PATH_SUFFIXES
        include/
    NO_CMAKE_SYSTEM_PATH
)
foreach(VORBIS_LIB
    vorbis
    vorbisenc
    vorbisfile
    )
    find_library(${VORBIS_LIB}_LIBRARY
        ${VORBIS_LIB}
        PATH_SUFFIXES
            lib/
        NO_CMAKE_SYSTEM_PATH
    )
    mark_as_advanced(${VORBIS_LIB}_LIBRARY)
    if(${VORBIS_LIB}_LIBRARY)
        list(APPEND VORBIS_LIBRARIES ${${VORBIS_LIB}_LIBRARY})
    endif()
endforeach(VORBIS_LIB)

mark_as_advanced(VORBIS_INCLUDE_DIR)

find_package_handle_standard_args("VORBIS"
    DEFAULT_MSG
    vorbis_LIBRARY
    VORBIS_INCLUDE_DIR
)
