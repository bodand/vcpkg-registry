if (VCPKG_TARGET_IS_WINDOWS 
        AND NOT VCPKG_TRIPLET MATCHES [[mingw]])
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif ()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoCLI"
    REF "7e9ee49f6979825fdba046eb58bf70120ebcb1e3"
    SHA512 "13b779c6229473b6bd9e57b2192c6fd1351ef63289f43d869d9928b7f9aa046da6b14f0b8fda2d92c823b47a94e5c300e1647b46fb056ecf6aaa71fcfc09fb6c")

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

