
add_definitions(-DUNDERSCORE)
add_library(xutil userio.f)
add_library(getosfile ../osrc/getosfile.c)

add_executable(xfoil 
		      xfoil.f xpanel.f xoper.f xtcam.f xgdes.f xqdes.f xmdes.f 
		      xsolve.f xbl.f xblsys.f xpol.f xplots.f pntops.f xgeom.f xutils.f modify.f 
		      blplot.f polplt.f aread.f naca.f spline.f plutil.f iopol.f gui.f sort.f 
		      dplot.f profil.f
		      frplot.f ntcalc.f
		      )
target_link_libraries(xfoil xutil plotlib osmap getosfile)


# todo: need to finish these - russt@mit.edu

#add_executable(pplot pplot.f polplt.f sort.f iopol.f)
#target_link_libraries(pplot xutil plotlib)

#add_executable(pxplot pxplot.f plutil.f gui.f)
#target_link_libraries(pxplot xutil plotlib)

pods_install_executables(xfoil) 

