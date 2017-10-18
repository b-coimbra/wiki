CC = g++
CFLAGS = -c -std=c++11 -Wall
PROGRAM = main
objects := $(patsubst %.cpp, %.o, $(wildcard *.cpp))

compile: main.o
	$(CC) main.o -o $(PROGRAM) && $(PROGRAM)

all: $(objects)
	$(CC) -o $(PROGRAM) $(objects)

main.o:
	$(CC) $(CFLAGS) main.cpp

clean:
	del /S *.o $(addprefix $(PROGRAM), .exe)