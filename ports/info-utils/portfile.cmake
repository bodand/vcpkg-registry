vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "bodand/InfoUtils"
    REF "ebfdde12654d6d75d5518e9e64d26c85bd002005"
    SHA512 0)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        "-DInfoUtils_BUILD_TESTS=OFF")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "InfoUtils")

