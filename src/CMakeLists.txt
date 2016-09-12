#############################################################################
#
#  XFOIL
#
#  Copyright (C) 2000 Mark Drela
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#############################################################################

set(XFOIL_SRCS xfoil.f xpanel.f xoper.f xtcam.f xgdes.f xqdes.f xmdes.f
  CIRCLE.INC xsolve.f xbl.f XBL.INC xblsys.f xpol.f xplots.f pntops.f
  XDES.INC xgeom.f xutils.f modify.f blplot.f polplt.f aread.f naca.f
  spline.f plutil.f iopol.f PINDEX.INC gui.f sort.f dplot.f XFOIL.INC
  profil.f userio.f)

option(INDIVIDUAL_TS_WAVE_FREQUENCY_PLOTTING
  "Individual TS-wave frequency plotting" OFF)

if(INDIVIDUAL_TS_WAVE_FREQUENCY_PLOTTING)
  set(XFOIL_SRCS ${XFOIL_SRCS} frplot.f ntcalc.f $<TARGET_OBJECTS:getosfile>
     $<TARGET_OBJECTS:osmap>)
else()
  set(XFOIL_SRCS ${XFOIL_SRCS} frplot0.f)
endif()

add_executable(xfoil ${XFOIL_SRCS})
set_target_properties(xfoil PROPERTIES VERSION ${PROJECT_VERSION})
target_link_libraries(xfoil plt)
install(TARGETS xfoil DESTINATION bin)

set(XFOIL_COPYING gpl.txt)
install(FILES ${XFOIL_COPYING} DESTINATION share/doc/${PROJECT_NAME}
  RENAME COPYING)

set(PXPLOT_SRCS pxplot.f PXPLOT.INC plutil.f gui.f userio.f)
add_executable(pxplot ${PXPLOT_SRCS})
set_target_properties(pxplot PROPERTIES VERSION ${PROJECT_VERSION})
target_link_libraries(pxplot plt)
install(TARGETS pxplot DESTINATION bin)

set(PPLOT_SRCS pplot.f PPLOT.INC polplt.f sort.f iopol.f PINDEX.INC userio.f)
add_executable(pplot ${PPLOT_SRCS})
set_target_properties(pplot PROPERTIES VERSION ${PROJECT_VERSION})
target_link_libraries(pplot plt)
install(TARGETS pplot DESTINATION bin)
