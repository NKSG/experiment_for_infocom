CC =gcc

all : pre_process.o
    $(cc) -o all pre_process.o

pre_process.o : pre_process.c
    $(cc) -c pre_process.c
    
    
      
    
