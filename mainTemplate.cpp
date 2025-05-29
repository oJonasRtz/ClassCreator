#include "ClassTemplate.hpp"

static void	drawTitle(const std::string &title, bool orange)
{
	if (orange)
		std::cout << ORANGE << std::string(30, '=') << "\n\t" << title << "\n" << std::string(30, '=') << RESET << std::endl;
	else
		std::cout << std::string(30, '=') << "\n\t" << title << "\n" << std::string(30, '=') << std::endl;
}

int	main(void)
{
	drawTitle("ClassTemplate", 1);
	return (0);
}

