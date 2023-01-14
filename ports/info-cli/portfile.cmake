if (VCPKG_TARGET_IS_WINDOWS 
        AND NOT VCPKG_TRIPLET MATCHES [[mingw]])
    vcpkg_check_linkage(ONLY_STATIC_LIBRARY)
endif ()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoCLI"
    REF "eac96f726305aeac6e99ed7499f1ab408aff2065"
    SHA512 "cf7bf96a7e97652f9ef7d07d254a70b437cb99e4bb153b0fb41614ce999403047d8de3b70b149cd53c2e9fbf81365ed43e09a091a014f8e89e68211b88de78a1")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}"
                      OPTIONS
                        "-DINFO_CLI_BUILD_TESTS=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "InfoCLI"
                         CONFIG_PATH "lib/cmake/InfoCLI")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

