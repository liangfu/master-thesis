#!/usr/bin/env python

import os
# from numpy import *
# from matplotlib.pyplot import *
from pylab import *
# from matplotlib.font_manager import fontManager, FontProperties

from matplotlib import rc
# rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
# rc('font',**{'family':'serif','serif':['Times']})
# rc('font',**{'family':'monospace','monospace':['Courier']})
rc('text', usetex=True)
rc('legend', fontsize=14)
rc('axes', titlesize=20)
rc('axes', labelsize=16)
rc('xtick', labelsize=14)

# params = {'backend': 'ps',
#           'axes.labelsize': 12,
#           'text.fontsize': 12,
#           'legend.fontsize': 12,
#           'title.fontsize': 14,
#           'xtick.labelsize': 10,
#           'ytick.labelsize': 10,
#           'text.usetex': True}
# rcParams.update(params)

# data = array([[1,0.574], [2,0.393], [3,0.334], [4,0.329], [5, 0.333], [6, 0.341], [7, 0.371], [8,0.393], [16,0.499], [32,0.539]])
data = array([['fuel', 0.0984, 0.0165],
              ['hemoglobin', 3.626, 0.524], 
              ['ventricle', 1.5214, 0.2334],
              ['engine', 4.6664, 0.6580], 
              ['head', 1.2250, 0.1745], 
              ['kidney', 1.7316, 0.2417]
              ]
             )

fn = 'fig-perf-bar.pdf'

# print a[:,1]
# plot(data[:,0],data[:,1])
n = arange(data[:,1].size)
# print data[:,1].tolist()
width = .35

# bar(n, data[:,1].tolist())
a = array([float(x) for x in data[:,1].tolist()])
# a = data[:,1] # array([2.0,3.0,4.0])
b = array([float(x) for x in data[:,2].tolist()]) # array([3.0,4.0,5.0])

re = b/a


print n
print a
print b
print re, '->', average(re)

p1 = bar(n, a, width, color='r')
p2 = bar(n+width, b, width, color='y'# , bottom=a
         )
p3 = plot(re*10, "bo--")
# bar(n, a, width, color='y', yerr=a)
# show()

xticks(n+width, data[:,0])
# yticks(arange(0, max(a+b)*2, 2))
xlabel('data set')
ylabel('time cost')
title('A Comparison of Contour Extraction Performance')
legend((p1[0], p2[0], p3[0]), ('Sequential', 'Hybrid Accelerated', 'Speedup'))
savefig(fn)
show()






# os.system('display '+fn)
# os.system('epstopdf '+fn)
# os.system('evince propagate-performance.pdf')

