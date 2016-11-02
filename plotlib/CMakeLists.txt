#############################################################################
#
#  Xplot11 Graphics Package
#
#  Copyright (C) 1996 Harold Youngren, Mark Drela
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Library General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Library General Public License for more details.
#
#  You should have received a copy of the GNU Library General Public
#  License along with this library; if not, write to the Free
#  Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#############################################################################

set(PLT_SRCS plt_base.f plt_font.f CHAR.INC SLAN.INC MATH.INC SYMB.INC
  plt_util.f plt_color.f set_subs.f gw_subs.f ps_subs.f pltlib.inc)

option(OLD_PLOT_COMPATIBILITY_ROUTINES
  "Add the old plot compatibility routines" OFF)

if(OLD_PLOT_COMPATIBILITY_ROUTINES)
  set(PLT_SRCS ${PLT_SRCS} plt_old.f)
endif()

option(PRIMITIVE_3D_VIEW_ROUTINES
  "Add the primitive 3D-view routines" OFF)

if(3D_VIEW_ROUTINES)
  set(PLT_SRCS ${PLT_SRCS} plt_3D.f)
endif()

if(WIN32)
  set(W32WIN_SRCS win32/W32win.c win32/rgbtbl.h win32/Xdefs.h)
  add_library(W32win OBJECT ${W32WIN_SRCS})
  set(PLT_SRCS ${PLT_SRCS} $<TARGET_OBJECTS:W32win>)
else()
  find_package(X11 REQUIRED)
  set(XWIN_SRCS Xwin.c)
  add_library(Xwin OBJECT ${XWIN_SRCS})
  target_compile_definitions(Xwin PRIVATE UNDERSCORE)
  target_include_directories(Xwin SYSTEM PRIVATE ${X11_INCLUDE_DIR})
  set(PLT_SRCS ${PLT_SRCS} $<TARGET_OBJECTS:Xwin>)
endif()

option(BUILD_SHARED_LIBS "Build all libraries as shared" OFF)

add_library(plt ${PLT_SRCS})

set(PLT_VERSION_MAJOR 4)
set(PLT_VERSION_MINOR 47)
set(PLT_VERSION ${PLT_VERSION_MAJOR}.${PLT_VERSION_MINOR})

set_target_properties(plt PROPERTIES VERSON ${PLT_VERSION})

if(NOT WIN32)
  target_link_libraries(plt PUBLIC ${X11_LIBRARIES})
endif()

if(BUILD_SHARED_LIBS)
  install(TARGETS plt ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

  set(PLT_COPYING GPL-Library)
  install(FILES ${PLT_COPYING} DESTINATION ${CMAKE_INSTALL_DOCDIR}
    RENAME COPYING.LIB)

  set(PLT_DOCS Notes)
  install(FILES ${PLT_DOCS} DESTINATION ${CMAKE_INSTALL_DOCDIR}
    RENAME plt_doc.txt)
endif()

add_subdirectory(examples)
add_subdirectory(sym)
