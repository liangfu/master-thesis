

import matplotlib.pyplot as plt
from matplotlib.path import Path
import matplotlib.patches as patches
from mpl_toolkits.axes_grid.axislines import Subplot
from matplotlib.axes import *

verts = [
    (0., 0.), # left, bottom
    (0., 1.), # left, top
    (1., 1.), # right, top
    (1., 0.), # right, bottom
    (0., 0.), # ignored
    ]

codes = [Path.MOVETO,
         Path.LINETO,
         Path.LINETO,
         Path.LINETO,
         Path.CLOSEPOLY,
         ]

path = Path(verts, codes)

fig = plt.figure()
ax = fig.add_subplot(111)
patch = patches.PathPatch(path, facecolor='orange', lw=2)

# for direction in ["left", "right", "bottom", "top"]:
#     ax.axis[direction].set_visible(False)
# dir(add_subplot)
# set_axis_off()
ax.set_axis_off()

ax.add_patch(patch)
ax.set_xlim(-2,2)
ax.set_ylim(-2,2)
plt.show()


