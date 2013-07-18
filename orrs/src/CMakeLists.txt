
add_definitions(-DOSFILE_DIR=${CMAKE_INSTALL_DIR}/lib/)

add_executable(osgen osgen.f io.f spline.f getarg0.f)
add_library(osmap osmap.f)
