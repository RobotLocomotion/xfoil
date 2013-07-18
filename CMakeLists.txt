cmake_minimum_required(VERSION 2.6.0)   
# for "optimum Fortran support" http://www.cmake.org/Wiki/CMake_Fortran_Issues

enable_language (Fortran)

# set up pods
set(POD_NAME avl)
include(cmake/pods.cmake)

add_subdirectory(orrs)
add_subdirectory(plotlib)
add_subdirectory(src)

