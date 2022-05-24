# Name of the program
NAME = dachaGATE

# Compiling flags
FLAGS = -std=c++14 -fno-exceptions -lrt -lpthread -L. -lwiringPi# -Wall -Wextra -Werror
CC = arm-linux-gnueabihf-g++

# Folders
SRC_DIR = ./
OBJ_DIR = ./obj/
INC_DIR = ./includes/

# Source files and object files
SRC_FILES = ttyHandler.cpp \
			callHandler.cpp \
			phoneList.cpp \
            main.cpp

INC_FILES = $(INC_DIR)ttyHandler.h \
			$(INC_DIR)callHandler.h \
			$(INC_DIR)phoneList.h

OBJ_FILES = $(SRC_FILES:.cpp=.o)

# Paths
SRC = $(addprefix $(SRC_DIR), $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR), $(OBJ_FILES))

# all rule
all: obj $(NAME)

obj:
	@mkdir -p $(OBJ_DIR)
$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp $(INC_FILES)
	$(CC) -I $(INC_DIR) -o $@ -c $< $(FLAGS)

# Compiling
$(NAME): $(OBJ)
	$(CC) $(OBJ) -o $(NAME) $(FLAGS)

# clean rule
clean:
	rm -Rf $(OBJ_DIR)

# fclean rule
fclean: clean
	rm -f $(NAME)

# re rule
re: fclean all

# phony
.PHONY: all clean fclean re
