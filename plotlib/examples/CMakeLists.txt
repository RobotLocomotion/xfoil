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

if(BUILD_TESTING)
  if(OLD_PLOT_COMPATIBILITY_ROUTINES)
    add_executable(volts volts.f)
    target_link_libraries(volts plt)
    add_test(NAME volts COMMAND volts)

    add_executable(volts_old volts_old.f)
    target_link_libraries(volts_old plt)
    add_test(NAME volts_old COMMAND volts_old)
  endif()

  add_executable(symbols symbols.f)
  target_link_libraries(symbols plt)
  add_test(NAME symbols COMMAND symbols)

  add_executable(symbolsall symbolsall.f)
  target_link_libraries(symbolsall plt)
  add_test(NAME symbolsall COMMAND symbolsall)

  add_executable(squares squares.f)
  target_link_libraries(squares plt)
  add_test(NAME squares COMMAND squares)

  add_executable(squaresdoublebuff squaresdoublebuff.f)
  target_link_libraries(squaresdoublebuff plt)
  add_test(NAME squaresdoublebuff COMMAND squaresdoublebuff)

  add_executable(spectrum spectrum.f)
  target_link_libraries(spectrum plt)
  add_test(NAME spectrum COMMAND spectrum)

  add_executable(cmap2 cmap2.f)
  target_link_libraries(cmap2 plt)
  add_test(NAME cmap2 COMMAND cmap2)

  add_executable(cmap3 cmap3.f)
  target_link_libraries(cmap3 plt)
  add_test(NAME cmap3 COMMAND cmap3)

  add_executable(defmap defmap.f)
  target_link_libraries(defmap plt)
  add_test(NAME defmap COMMAND defmap)

  # Disabled due to build errors.
  # add_executable(gridtest gridtest.f)
  # target_link_libraries(gridtest plt)
  # add_test(NAME gridtest COMMAND gridtest)

  add_executable(zoomtest zoomtest.f)
  target_link_libraries(zoomtest plt)
  add_test(NAME zoomtest COMMAND zoomtest)

  if(OLD_PLOT_COMPATIBILITY_ROUTINES)
    add_executable(contest contest.f)
    target_link_libraries(contest plt)
    add_test(NAME contest COMMAND contest)
  endif()
endif()
