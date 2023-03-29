
ex00 -N -f=ft.h
ft
source_mock_stuff ====
#include <stdio.h>

// this is already in stupidity.c
/*void ft_putchar(char c)
{
	c++;
	printf("ft_putchar\n");
}*/
void ft_putstr(char* str)
{
	str++;
	printf("ft_putstr\n");
}
int ft_strcmp(char* s1, char* s2)
{
	s1++;
	s2++;
	printf("ft_strcmp\n");
	return 0;
}

int ft_strlen(char* str)
{
	str++;
	printf("ft_strlen\n");
	return 0;
}

void ft_swap(int* a, int* b)
{
	a++;
	b++;
	printf("ft_swap\n");
}



==== main -f=mock_stuff.c ====
#include "ft.h"
#include <stdio.h>
int main()
{
	ft_putchar('\n');
	ft_putstr(NULL);
	ft_strcmp(NULL,NULL);
	ft_strlen(NULL);
	ft_swap(NULL,NULL);
}
==== check -e ====
$expected = '
ft_putstr
ft_strcmp
ft_strlen
ft_swap
';
====


ex01 -N -f=ft_boolean.h
ft_boolean
main ====
#include "ft_boolean.h"
void ft_putstr(char *str)
{
	while (*str)
		write(1, str++, 1);
}

t_bool ft_is_even(int nbr)
{
	return ((EVEN(nbr)) ? TRUE : FALSE);
}

int main(int argc, char **argv)
{
	(void)argv;
	if (ft_is_even(argc - 1) == TRUE)
		ft_putstr(EVEN_MSG);
	else
		ft_putstr(ODD_MSG);
	return (SUCCESS);
}
==== check -t ====
%tests = (
	"$program" => "I have an even number of arguments.\n",
	"$program asdf" => "I have an odd number of arguments.\n",
	"$program asdf qwerty" => "I have an even number of arguments.\n",
);
====


ex02 -N -f=ft_abs.h
abs
main ====
#include "ft_abs.h"
#include <stdio.h>
int main()
{
	TEST(ABS(15), 15);
	TEST(ABS(0), 0);
	TEST(ABS(-25), 25);
	TEST(ABS(1234567), 1234567);
	TEST(ABS(-1234567), 1234567);
	TEST(ABS(2147483647), 2147483647);
	// im not sure about this one actually... use your head
	TEST(ABS((int)-2147483648), 0);
}
==== check -l=7 ====
====


ex03 -N -f=ft_point.h
point
main ====
#include "ft_point.h"
#include <stdio.h>
void set_point(t_point *point)
{
	point->x = 42;
	point->y = 21;
}
int main(void)
{
	t_point point;
	set_point(&point);
	printf("%d,%d", point.x, point.y);
}
==== check -e ====
$expected = ((('42,21')));
====




ex05 -N -f1=ft_show_tab.c -f2=ft_stock_par.h
show_tab
main_basic -f=ft_show_tab.c ====
#include "ft_stock_par.h"
void ft_show_tab(struct s_stock_par* par);
int main()
{
	t_stock_par stuff[2];
	char* words[] = {"lol","hijack", NULL};
	stuff[0].size_param = 10;
	stuff[0].str = "hello world!";
	stuff[0].copy = "hello world!";
	stuff[0].tab = words;
	
	stuff[1].str = NULL;

	ft_show_tab(stuff);
}
==== check_basic -e ====
$expected = 'hello world!
10
lol
hijack
';
==== main_empty -f=ft_show_tab.c ====
#include "ft_stock_par.h"
void ft_show_tab(struct s_stock_par* par);
int main()
{
	t_stock_par stuff[2];
	char* words[] = {NULL};
	stuff[0].size_param = 0;
	stuff[0].str = "";
	stuff[0].copy = "";
	stuff[0].tab = words;
	
	stuff[1].str = NULL;

	ft_show_tab(stuff);
}
==== check_basic -e ====
$expected = '
0
';
====

















