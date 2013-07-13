CC =g++

all : pre_process.o
    $(cc) -o all statistic.o

pre_process.o : statistic.cpp
    $(cc) -c statistic.cpp
    
    
      
    
