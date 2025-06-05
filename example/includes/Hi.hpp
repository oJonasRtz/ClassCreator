#ifndef HI_HPP
#define HI_HPP

# define BRIGHT_RED "\033[1;31m"
# define BRIGHT_BLUE "\033[1;34m"
# define ORANGE "\033[38;5;208m"
# define BRIGHT_GREEN "\033[1;32m"
# define RESET "\033[0m"
# define LINE 30

#include <iostream>

class Hi
{
	private:
		/* data */
	public:
		Hi();
		Hi(const Hi &other);
		Hi	&operator=(const Hi &other);
		~Hi();
};

std::ostream	&operator<<(std::ostream &out, const Hi &other);

#endif
