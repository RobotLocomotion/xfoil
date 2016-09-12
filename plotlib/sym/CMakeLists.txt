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

add_executable(symgen symgen.f)
target_link_libraries(symgen plt)

if(BUILD_TESTING)
  add_executable(plt_font_test test.f)
  set_target_properties(plt_font_test PROPERTIES OUTPUT_NAME test)
  target_link_libraries(plt_font_test plt)
  add_test(NAME plt_font_test COMMAND plt_font_test)
endif()
