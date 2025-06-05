#include "Hi.hpp"

Hi::Hi()
{
	std::cout << BRIGHT_GREEN "Hi: constructor called\n" RESET;
}
Hi::Hi(const Hi &other)
{
	std::cout << BRIGHT_GREEN "Hi: copy constructor called\n" RESET;
	*this = other;
}
Hi&	Hi::operator=(const Hi &other)
{
	std::cout << BRIGHT_GREEN "Hi: assignment operator\n" RESET;
	// if (this != &other)
		/*	copy	*/
	(void)other;
	return (*this);
}
Hi::~Hi()
{
	std::cout << BRIGHT_RED "Hi: destructor called\n" RESET;
}

std::ostream	&operator<<(std::ostream &out, const Hi &other)
{
	(void)other;
	out << "temp";
	return (out);
}
