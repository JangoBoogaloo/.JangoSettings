PROJECT := program
SCRIPT :=$(PROJECT) #add arguments

#set the compiler option
CFLAGS := -Wall \
				  -pedantic \
				  -Wextra \
				  -Wno-missing-field-initializers \
				  -g

LANG := CPP

CC := gcc #g++ #clang #clang++

ifeq ($(LANG), CPP)
	CC := clang++
	EXT := cpp
else
	CC := clang
	EXT := c
endif

OBJECT_DIR :=obj/
SOURCE_DIR :=src/

#header include
INCLUDES := -I./$(SOURCE_DIR)#\ 
#library link
LD_LIBS := #-lpthread #\ 

SOURCES :=$(wildcard $(SOURCE_DIR)*.$(EXT)) 
OBJECTS :=$(SOURCES:$(SOURCE_DIR)%.c=$(OBJECT_DIR)%.$(EXT))

$(PROJECT): $(OBJECTS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(PROJECT) $(OBJECTS) $(LD_LIBS)

$(OBJECT_DIR)%.o: $(SOURCE_DIR)%.$(EXT)
	$(CC) $(CFLAGS) -c -o $@ $<

all: $(PROJECT) $(OBJECTS)

run: all
	./$(SCRIPT)

clean:
		rm -rf $(OBJECT_DIR)*.o $(PROJECT)
