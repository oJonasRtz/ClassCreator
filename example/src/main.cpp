#include "Hi.hpp"

static void	drawTitle(const std::string &title, bool orange)
{
	if (orange)
		std::cout << ORANGE << std::string(LINE, '=') << "\n\t" << title << "\n" << std::string(LINE, '=') << RESET << std::endl;
	else
		std::cout << std::string(LINE, '=') << "\n\t" << title << "\n" << std::string(LINE, '=') << std::endl;
}

int	main(void)
{
	drawTitle("Hi", 1);
	return (0);
}

