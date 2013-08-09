
find_package( X11 REQUIRED )
include_directories ( ${X11_INCLUDE_DIR} )

add_library(xwin Xwin.c) # note: could use object library here for cmake>=2.8.8

add_library(plotlib 
		    plt_base.f plt_font.f plt_util.f plt_color.f 
          	    set_subs.f gw_subs.f ps_subs.f )
add_definitions(-DUNDERSCORE)
target_link_libraries(plotlib xwin ${X11_LIBRARIES})
