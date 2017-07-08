CC=g++
CCFLAGS=-g -Wall -Wextra
#LDFLAGS=-L/usr/local/Cellar/sdl2/2.0.5/lib/libSDL2.dylib
LDFLAGS=$(SDL)
SDL=-lSDL2
SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.cpp=.o)
TARGET=a.out

all: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c %.h
	$(CC) $(CCFLAGS) -c $<

%.o: %.c
	$(CC) $(CCFLAGS) -c $<

clean:
	rm -f *.o $(TARGET)
