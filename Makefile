CC =g++
OBJ = statistic.o
SOURCE = statistic.cpp

all : $(OBJ)
	$(CC) -o all $(OBJ)

$(OBJ) : $(SOURCE)
	$(CC) -c $(SOURCE)
    
    
      
    
