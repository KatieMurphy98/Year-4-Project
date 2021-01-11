#python -m pip install -U pip
#pip install matplotlib
#pip install pandas
#pip install openpyxl

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import openpyxl as xl
import math

name = ['Salmon Ladder', 'Quintuple Steps', 'Floating Steps', 'Log Grip', 'Jump Hang', 'Quad Steps', 'Jumping Spider']
ntimes = [41, 32, 28, 21, 18, 16, 14]
obst = pd.DataFrame(data={'name':name, 'ntimes':ntimes})
 
def barplots_yscaling():
    ##### CONTROL #####
    plt.bar(name[0:4], ntimes[0:4], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)

    ##### LOG10 #####
    plt.bar(name[0:4], ntimes[0:4], color="#69b3a2")
    plt.yscale('symlog')
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)

    ##### TRUNCATED #####
    plt.bar(name[0:4], ntimes[0:4], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)
    plt.ylim([20, 42])
barplots_yscaling()

def barplots_axisratio():
    ##### CONTROL #####
    plt.bar(name[0:7], ntimes[0:7], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)
    plt.show()

    ##### TALL #####
    plt.bar(name[0:7], ntimes[0:7], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)
    plt.gca().set_aspect('0.2')
    plt.show()

    ##### WIDE #####
    plt.bar(name[0:7], ntimes[0:7], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)
    plt.gca().set_aspect('0.05')
    plt.show()
    
barplots_axisratio()