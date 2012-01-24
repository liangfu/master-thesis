#!/usr/bin/env python

import os
from pylab import *
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

data = array([[1,1.2], [2,1.1], [16,1.2], [32,1.25]])
fn = 'fig-perf-plot2.pdf'


s = interpolate.InterpolatedUnivariateSpline(data[:,0], data[:,1])

# xnew = linspace(1,32,100)# arange(1, 32, 0.1)
xnew = arange(1, 33, 1)
ynew = s(xnew)

# print a[:,1]
# plot(data[:,0],data[:,1], 'o', xnew, ynew)
plot(data[:,0],data[:,1])

# for direction in ["left", "right", "bottom", "top"]:
#     ax.axis[direction].set_visible(False)

# bar(data[:,0],data[:,1])
# xticks(data[:,0]+0.2)

xlabel('number of threads')
ylabel('time cost (unit: second)')
title('Multi-threading Contour Propagation Performance')
savefig(fn)
show()

# os.system('display '+fn)
# os.system('epstopdf '+fn)
# os.system('evince propagate-performance.pdf')

