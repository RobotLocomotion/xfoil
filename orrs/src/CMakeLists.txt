#############################################################################
#
#  Orr-Sommerfeld Computation and Database Package
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

add_executable(osgen osgen.f io.f spline.f getarg0.f)

add_executable(osgen1 osgen1.f io.f spline.f getarg0.f)

if(OLD_PLOT_COMPATIBILITY_ROUTINES)
  add_executable(fscorr fscorr.f fs.f plutil.f)
  target_link_libraries(fscorr plt)

  add_executable(fsrun fsrun.f fs.f)
  target_link_libraries(fsrun plt)
endif()

add_executable(intai intai.f osmap.f plutil.f)
target_compile_definitions(intai PRIVATE "OSFILE_DIR=${ORRS_DIR}")
target_link_libraries(intai plt)

if(OLD_PLOT_COMPATIBILITY_ROUTINES)
  add_executable(mappl1 mappl1.f ask1.f conlab.f io.f getarg0.f)
  target_link_libraries(mappl1 plt)

  add_executable(ncorr ncorr.f fs.f plutil.f)
  target_link_libraries(ncorr plt)
endif()

add_executable(osrun osrun.f fs.f orrs.f ORRS.INC ospres.f OSPRES.INC
  plutil.f userio.f)
target_link_libraries(osrun plt)

add_executable(osseq osseq.f fs.f orrs.f ORRS.INC ospres.f OSPRES.INC
  plutil.f userio.f)
target_link_libraries(osseq plt)

add_executable(pfplot pfplot.f fs.f ask1.f)
target_link_libraries(pfplot plt)

add_executable(roll roll.f)
target_link_libraries(roll plt)

add_executable(as2bi as2bi.f io.f getarg0.f)

add_executable(bi2as bi2as.f io.f getarg0.f)

# Disabled due to build errors.
# add_executable(bi2bi bi2bi.f io.f getarg0.f)

add_executable(otest otest.f osmap.f)
target_compile_definitions(otest PRIVATE "OSFILE_DIR=${ORRS_DIR}")

add_executable(osweep osweep.f osmap.f)
target_compile_definitions(osweep PRIVATE "OSFILE_DIR=${ORRS_DIR}")
