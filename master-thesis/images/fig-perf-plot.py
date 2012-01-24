#!/usr/bin/env python

import os
from pylab import *
from scipy import optimize
from matplotlib.font_manager import fontManager, FontProperties
from mpl_toolkits.axes_grid.axislines import Subplot
from matplotlib import rc
from scipy import interpolate
# rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
rc('font',**{'family':'serif','serif':['Times']})
# rc('font',**{'family':'monospace','monospace':['Courier']})
rc('text', usetex=True)

fig = figure(1)
ax = Subplot(fig,111)
fig.add_subplot(ax)


# params = {'backend': 'ps',
#           'axes.labelsize': 10,
#           'text.fontsize': 10,
#           'legend.fontsize': 10,
#           'xtick.labelsize': 8,
#           'ytick.labelsize': 8,
#           'text.usetex': True}
# rcParams.update(params)

data1 = array([[1,0.574], [2,0.393], [3,0.334], [4,0.329], [5, 0.333], 
               [6, 0.341], [7, 0.371], [8,0.393], [9,0.413], [10,0.413], 
               [11,0.433], [12,0.443], [13,0.453], [14,0.463], [15,0.483], [16,0.499]])
data2 = array([[1,0.582], [2,0.328], [3,0.231], [4,0.180], [5,0.174], 
               [6,0.168], [7,0.185], [8,0.188], [9,0.192], [10,0.211], 
               [11,0.221], [12,0.324], [13,0.436], [14,0.532], [15,0.565], [16,0.573]])
fn = 'fig-perf-plot.pdf'



# fitfunc = lambda p, x: log(p[0]*x+p[1])**2+p[2]*arctan(p[3]*x)+p[4]
fitfunc = lambda p, x: p[0]/(x**p[1]+x*p[1]+p[2])+p[3]*arctan(p[4]*x+p[5])+p[6]
errfunc = lambda p, x, y: fitfunc(p, x)- y
p0 = [1., 1., 1., 1., 1., 1., 1.] # Initial guess for the parameters

# fitfunc = lambda p, x: p[0]*sin(p[1]*x+p[2])+p[3]
# # fitfunc = lambda p, x: p[0]/(x**p[3])+p[4]*arctan(p[1]*x)+p[2]
# errfunc = lambda p, x, y: fitfunc(p, x)- y
# p0 = [1., 1., 1., 1.] # Initial guess for the parameters

pd1, success1 = optimize.leastsq(errfunc, p0[:], args=(data1[:,0], data1[:,1]))
print pd1
pd2, success2 = optimize.leastsq(errfunc, p0[:], args=(data2[:,0], data2[:,1]))
print pd1

time = arange(1, 17, .1) # linspace(Tx.min(), Tx.max(), 100)

# Plot of the data and the fit
# plot(data[:,0], data[:,1], "bo")
# plot(data1[:,0], data1[:,1], "yo", time, fitfunc(pd1, time), "y:", label='dual-core (Intel E5300)') 
# plot(data2[:,0], data2[:,1], "rx", time, fitfunc(pd2, time), "r-", label='quad-core (Intel i5)') 
plot(time, fitfunc(pd1, time), "b--", label='Dual-core (Intel E5300)') 
plot(data1[:,0], data1[:,1], "bo") 
plot(time, fitfunc(pd2, time), "r-", label='Quad-core (Intel i5)') 
plot(data2[:,0], data2[:,1], "rx") 


# ----------------------------------------------------------------------------
# s = interpolate.InterpolatedUnivariateSpline(data[:,0], data[:,1])

# xnew = linspace(1,32,100)# arange(1, 32, 0.1)
# xnew = arange(1, 33, 1)
# ynew = s(xnew)

# print a[:,1]
# plot(data[:,0],data[:,1], 'o', xnew, ynew)
# plot(data[:,0],data[:,1])

# for direction in ["left", "right", "bottom", "top"]:
#     ax.axis[direction].set_visible(False)

# bar(data[:,0],data[:,1])
# xticks(data[:,0]+0.2)

xlabel('number of threads')
ylabel('time cost (unit: second)')
title('Multi-threading Contour Propagation Performance')
legend(loc='lower right')
savefig(fn)
show()

# os.system('display '+fn)
# os.system('epstopdf '+fn)
# os.system('evince propagate-performance.pdf')

