vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoUtils"
    REF "ebfdde12654d6d75d5518e9e64d26c85bd002005"
    SHA512 "191685c9c0a25d91c38012f13964924de718099d6f92ecc464e776313e1348a520ad9ee5a6ca3607ab54c9ba5521990d7beaa3648e1ca832288411e77b9e017d"
    PATCHES
        "00-cmake-include-fix.patch")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}"
                      OPTIONS
                          "-DInfoUtils_BUILD_TESTS=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "InfoUtils"
                         CONFIG_PATH "lib/cmake/InfoUtils")

file(INSTALL "${SOURCE_PATH}/LICENSE" 
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)

