
import matplotlib.pyplot as plt
import numpy as np
from pylab import genfromtxt 
data = genfromtxt("marine_data.txt",delimiter=" ")
output=data[:,6];

para1=data[:,0];
para2=data[:,1];
para3=data[:,2];
para4=data[:,3];
para5=data[:,4];
para6=data[:,5];

para1=para1/-5.0
para2=para2/np.max(para2)
para3=para3/np.max(para3)
para4=para4/np.max(para4)
para5=para5/np.max(para5)
para6=para6/np.max(para6)

output=output/np.max(output)

print output[:10]

