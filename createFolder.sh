#!/bin/bash

#Check input
# $# == Argc
if [ $# -lt 2 ]; then
	echo "How to use: ./createFolder.sh <folder name> <class name>"
	exit 1
fi

FOLDERNAME=$1
CLASSNAME=$2

mkdir -p $FOLDERNAME
mkdir -p $FOLDERNAME/src
mkdir -p $FOLDERNAME/includes
cat > $FOLDERNAME/src/main.cpp << EOF
#include <iostream>

int	main(void)
{
	std::cout << "Hello world\n";
	return (0);
}

EOF

cat > $FOLDERNAME/Makefile << EOF
NAME=temp
TESTS = 5

CC = c++
FLAGS = -g3 -Wall -Werror -Wextra -std=c++98

INCLUDE = includes
SRC =	${CLASSNAME}.cpp\\
		main.cpp
SRCS = \$(addprefix src/, \$(SRC))
OBJS = \$(SRCS:.cpp=.o)

RM = rm -f

all: \$(NAME)

\$(NAME): \$(OBJS)
	@\$(CC) \$(FLAGS) -I\$(INCLUDE) -o \$(NAME) \$(OBJS)

src/%.o: src/%.cpp
	@echo "\033[1;32mCompiling	->	\$<\033[0m"
	@\$(CC) \$(FLAGS) -I\$(INCLUDE) -c \$< -o \$@

run: all
	@valgrind ./\$(NAME)

test: all
	@for i in \$(shell seq 1 \$(TESTS)); do \\
		valgrind ./\$(NAME) \$\$i; \\
		if [ \$\$i -eq 3 ]; then \\
			cat test_shrubbery; \\
		fi; \\
	done

clean:
	@echo "\033[1;32m===========================================\033[0m"
	@echo "\033[1;32m		OBJECTS REMOVED						\033[0m"
	@echo "\033[1;32m===========================================\033[0m"
	@\$(RM) \$(OBJS)

fclean: clean
	@echo "\033[1;32m===========================================\033[0m"
	@echo "\033[1;32m		\$(NAME) REMOVED						\033[0m"
	@echo "\033[1;32m===========================================\033[0m"	
	@\$(RM) \$(NAME)

re: fclean all

.PHONY: all clean fclean re run
EOF


#Creates class
./createClass.sh $CLASSNAME

mv ${CLASSNAME}.cpp  $FOLDERNAME/src
mv ${CLASSNAME}.hpp  $FOLDERNAME/includes
