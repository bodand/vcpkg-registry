if (VCPKG_TARGET_IS_WINDOWS 
        AND NOT VCPKG_TRIPLET MATCHES [[mingw]])
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif ()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoCLI"
    REF "e1b5616cf50695597216ffad67b4c465308222ee"
    SHA512 "581641ba7c9541b2885149fda8468abf142b82b59c739a3b1094cf33dc49f20701f9028ce58e3c4ed79bf393fa3afb0f7555b9fe94cf8a2b0")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}"
                      OPTIONS
                        "-DINFO_CLI_BUILD_TESTS=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "InfoCLI"
                         CONFIG_PATH "lib/cmake/InfoCLI")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" 
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)

