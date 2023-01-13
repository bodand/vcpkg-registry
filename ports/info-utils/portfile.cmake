vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoUtils"
    REF "ad502245f96bb8674e5f40dc6195421622df9e92"
    SHA512 "e1eff8dc2495d81f49666573daef15f350517fb4c190c00ff5e13e8531326cde49d5c17a0a3d8e0317927e77e71f410948996941651b12b978f5f1ef791c69f8")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}"
                      OPTIONS
                          "-DInfoUtils_BUILD_TESTS=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "InfoUtils"
                         CONFIG_PATH "lib/cmake/InfoUtils")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib")

file(INSTALL "${SOURCE_PATH}/LICENSE" 
     DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
     RENAME copyright)

