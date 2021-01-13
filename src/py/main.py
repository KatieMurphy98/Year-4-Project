#python -m pip install -U pip
#pip install matplotlib
#pip install pandas
#pip install openpyxl

import matplotlib as mat
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import openpyxl as xl
import math
from matplotlib import cm

import os
os.chdir("C:/Users/Katie/OneDrive/Uni_Work_Year4/Project/Year-4-Project/Plots/Py")


NinjaWarrior = pd.read_excel('https://query.data.world/s/tjkd2yop2xh2x4o2j5fhatxdidcvty')
NinjaWarrior = NinjaWarrior.rename(columns={"Season":"season", "Location":"location", "Round/Stage":"stage", "Obstacle Name":"name", "Obstacle Order":"order"})

name = ['Salmon Ladder', 'Quintuple Steps', 'Floating Steps', 'Log Grip', 'Jump Hang', 'Quad Steps', 'Jumping Spider']
ntimes = [41, 32, 28, 21, 18, 16, 14]

FinalsRegionalCity     = np.array([38, 15, 11, 9])
NationalFinalsStage2   = np.array([1,  0,  0,  0])
SemiFinals             = np.array([2,  1,  0,  1])
Qualifying             = np.array([0,  1,  0,  1])  
QualifyingRegionalCity = np.array([0,  15, 17, 9])
NationalFinalsStage1   = np.array([0,  0,  0,  1])

rounds = np.array(['Finals (Regional/City)', 'National Finals-Stage 2', 'Semi-Finals', 'Qualifying', 'Qualifying (Regional/City)', 'National Finals - Stage 1'])

obst = pd.DataFrame(data={'name':name, 'ntimes':ntimes})

 
def barplots_yscaling():
    ##### CONTROL #####
    plt.bar(name[0:nobst], ntimes[0:4], color="#69b3a2")
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)

    ##### LOG10 #####
    plt.bar(name[0:nobst], ntimes[0:4], color="#69b3a2")
    plt.yscale('symlog')
    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(rotation=90)

    ##### TRUNCATED #####
    plt.bar(name[0:nobst], ntimes[0:4], color="#69b3a2")
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

def barplots_stacked(nobst):

    ##### CONTROL #####
    def default(title):
        plt.bar(name[0:nobst], 
                FinalsRegionalCity, 
                bottom=(NationalFinalsStage2+SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
        
        plt.bar(name[0:nobst],
                NationalFinalsStage2,
                bottom=(SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
        
        plt.bar(name[0:nobst], 
                SemiFinals, 
                bottom=(Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
        
        plt.bar(name[0:nobst], 
                Qualifying, 
                bottom=(QualifyingRegionalCity+NationalFinalsStage1))
        
        plt.bar(name[0:nobst], 
                QualifyingRegionalCity, 
                bottom=(NationalFinalsStage1))
        
        plt.bar(name[0:nobst], 
                NationalFinalsStage1)
        
        plt.xlabel('Obstacle')
        plt.ylabel('Times Used')
        plt.xticks(rotation=90)
        plt.title(title) 
        plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1))

    ##### VIRIDIS #####
    def viridis(title):
        viridis = cm.get_cmap('viridis', 6)
    
        plt.bar(name[0:nobst], 
                FinalsRegionalCity, 
                color=viridis.colors[0],  
                bottom=(NationalFinalsStage2+SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                NationalFinalsStage2, 
                color=viridis.colors[1], 
                bottom=(SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst],
                SemiFinals, 
                color=viridis.colors[2], 
                bottom=(Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                Qualifying, 
                color=viridis.colors[3], 
                bottom=(QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                QualifyingRegionalCity, 
                color=viridis.colors[4], 
                bottom=(NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                NationalFinalsStage1, 
                color=viridis.colors[5])
    
        plt.xlabel('Obstacle')
        plt.ylabel('Times Used')
        plt.xticks(rotation=90)
        plt.title(title) 
        plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1))
    
    ##### GREY #####
    def grey(title):
        cmap = mat.cm.get_cmap('Greys')
    
        plt.bar(name[0:nobst], 
                FinalsRegionalCity, 
                color=cmap(0.8),  
                bottom=(NationalFinalsStage2+SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                NationalFinalsStage2, 
                color=cmap(0.7), 
                bottom=(SemiFinals+Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst],
                SemiFinals, 
                color=cmap(0.6), 
                bottom=(Qualifying+QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                Qualifying, 
                color=cmap(0.5), 
                bottom=(QualifyingRegionalCity+NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                QualifyingRegionalCity, 
                color=cmap(0.4), 
                bottom=(NationalFinalsStage1))
    
        plt.bar(name[0:nobst], 
                NationalFinalsStage1, 
                color=cmap(0.3))
        
        plt.xlabel('Obstacle')
        plt.ylabel('Times Used')
        plt.xticks(rotation=90)
        plt.title(title) 
        plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1)) 

     

    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    viridis("A")
    plt.subplot(212)
    default("B")
    plt.savefig('Ninja_Data/colours/stacked/set_a.jpg',bbox_inches='tight', dpi=150)

    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    default("A")
    plt.subplot(212)
    viridis("B")
    plt.savefig('Ninja_Data/colours/stacked/set_b.jpg',bbox_inches='tight', dpi=150)


    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    default("A")
    plt.subplot(212)
    grey("B")
    plt.savefig('Ninja_Data/colours/stacked/set_c.jpg',bbox_inches='tight', dpi=150)


    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    grey("A")
    plt.subplot(212)
    default("B")
    plt.savefig('Ninja_Data/colours/stacked/set_d.jpg',bbox_inches='tight', dpi=150)


    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    viridis("A")
    plt.subplot(212)
    grey("B")
    plt.savefig('Ninja_Data/colours/stacked/set_e.jpg',bbox_inches='tight', dpi=150)


    fig=plt.figure(figsize = (7,7))
    fig.subplots_adjust(hspace=1)
    plt.subplot(211)
    grey("A")
    plt.subplot(212)
    viridis("B")
    plt.savefig('Ninja_Data/colours/stacked/set_f.jpg',bbox_inches='tight', dpi=150)  
barplots_stacked(4)

def barplots_sidebyside(nobst):
    
    pos = np.arange(len(name[0:nobst]))
    barwidth = np.array([0.8/3, 0.8/4, 0.8/2, 0.8/4])


    ##### CONTROL #####
    plt.bar(pos, 
            FinalsRegionalCity,
            barwidth)

    plt.bar(pos+np.array([0.8/3, 0, 0, 0]),
            NationalFinalsStage2,
            barwidth)

    plt.bar(pos+np.array([1.6/3, 0.8/4, 0, 0.8/4]), 
            SemiFinals, 
            barwidth)

    plt.bar(pos+np.array([2.4/3, 1.6/4, 0.8/4, 1.6/4]), 
            Qualifying,
            barwidth)

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 2.4/4]), 
            QualifyingRegionalCity,
            barwidth)

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 3.2/4]),
            NationalFinalsStage1,
            barwidth)

    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(ticks=np.arange(0, 4, step=1), labels=name[0:nobst], rotation=90)
    plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1))
    plt.show()

    ##### VIRIDIS #####

    viridis = cm.get_cmap('viridis', 6)

    plt.bar(pos, 
            FinalsRegionalCity,
            barwidth,
            color=viridis.colors[0])

    plt.bar(pos+np.array([0.8/3, 0, 0, 0]),
            NationalFinalsStage2,
            barwidth,
            color=viridis.colors[1])

    plt.bar(pos+np.array([1.6/3, 0.8/4, 0, 0.8/4]), 
            SemiFinals,
            barwidth,
            color=viridis.colors[2])

    plt.bar(pos+np.array([2.4/3, 1.6/4, 0.8/4, 1.6/4]), 
            Qualifying,
            barwidth,
            color=viridis.colors[3])

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 2.4/4]), 
            QualifyingRegionalCity,
            barwidth,
            color=viridis.colors[4])

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 3.2/4]),
            NationalFinalsStage1,
            barwidth,
            color=viridis.colors[5])

    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(ticks=np.arange(0, 4, step=1), labels=name[0:nobst], rotation=90)
    plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1))
    plt.show()

     ##### GREY #####
    cmap = mat.cm.get_cmap('Greys')

    plt.bar(pos, 
            FinalsRegionalCity,
            barwidth,
            color=cmap(0.8))

    plt.bar(pos+np.array([0.8/3, 0, 0, 0]),
            NationalFinalsStage2,
            barwidth,
            color=cmap(0.7))

    plt.bar(pos+np.array([1.6/3, 0.8/4, 0, 0.8/4]), 
            SemiFinals,
            barwidth,
            color=cmap(0.6))

    plt.bar(pos+np.array([2.4/3, 1.6/4, 0.8/4, 1.6/4]), 
            Qualifying,
            barwidth,
            color=cmap(0.5))

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 2.4/4]), 
            QualifyingRegionalCity,
            barwidth,
            color=cmap(0.4))

    plt.bar(pos+np.array([1.6/3, 2.4/4, 1.6/4, 3.2/4]),
            NationalFinalsStage1,
            barwidth,
            color=cmap(0.3))

    plt.xlabel('Obstacle')
    plt.ylabel('Times Used')
    plt.xticks(ticks=np.arange(0, 4, step=1), labels=name[0:nobst], rotation=90)
    plt.legend(rounds, loc=0, title='Round', bbox_to_anchor=(1, 1))
    plt.show()
barplots_sidebyside(4)

##### sales #####

   month = list(range(1, 13))
   
   salesA = [211.0, 210.7, 210.1, 211.4, 210.0, 209.7, 208.8, 208.8, 208.8, 210.6, 211.9, 212.8]
   salesB = [201.5, 203.5, 204.9, 207.1, 210.5, 210.5, 209.8, 208.8, 209.5, 213.2, 213.7, 215.1]
   salesC = [237.1, 240.6, 243.8, 245.3, 246.0, 246.3, 247.7, 247.6, 247.8, 249.4, 249.0, 249.9]
   salesD = [214.8, 215.3, 217.5, 218.8, 220.7, 222.2, 226.7, 228.4, 233.2, 235.7, 237.1, 240.6]
   
   viridis = cm.get_cmap('viridis', 6)

   #### A and B ####
   ###  CONTROL ###
   plt.plot(month, salesA, color = viridis.colors[0])
   plt.legend(['Company A'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/A.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   plt.plot(month, salesB, color = viridis.colors[4])
   plt.legend(['Company B'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/B.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   plt.plot(month, salesA, color = viridis.colors[0])
   plt.plot(month, salesB, color = viridis.colors[4])
   plt.legend(['Company A', 'Company B'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/AB.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   ### ZEROED ###
   plt.plot(month, salesA, color = viridis.colors[0])
   plt.plot(month, salesB, color = viridis.colors[4])
   plt.legend(['Company A', 'Company B'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.ylim(bottom=0)
   plt.savefig('Sales/AB_zero.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   
   #### C and D ####
   ### CONTROL ###
   inferno = cm.get_cmap('inferno', 15)
   
   plt.plot(month, salesC, color = inferno.colors[7])
   plt.legend(['Company C'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/C.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   plt.plot(month, salesD, color = inferno.colors[11])
   plt.legend(['Company D'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/D.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   plt.plot(month, salesC, color = inferno.colors[7])
   plt.plot(month, salesD, color = inferno.colors[11])
   plt.legend(['Company C', 'Company D'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/CD.jpg',bbox_inches='tight', dpi=150)
   plt.show()

   ### ZEROED ###
   plt.plot(month, salesC, color = inferno.colors[7])
   plt.plot(month, salesD, color = inferno.colors[11])
   plt.ylim(bottom=0)
   plt.legend(['Company C', 'Company D'], loc=0, title='Company', bbox_to_anchor=(1, 1))
   plt.savefig('Sales/CD_zeroed.jpg',bbox_inches='tight', dpi=150)
   plt.show()
###
