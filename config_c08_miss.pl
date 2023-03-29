

=begin comment

this appears slight;y different to ft_strs_to_tab.c
needs a rework to test properly i think


ex04 -N -f1=ft_param_to_tab.c -f2=ft_stock_par.h
param
source_split_whitespaces ====
#include <stdlib.h>
int		my_isspace(char c)
{
	return (c == ' ' || c == '\n' || c == '\t');
}

int		my_spaced_strlen(char *str)
{
	int len;

	len = 0;
	while (*str != 0 && !my_isspace(*str))
	{
		len++;
		str++;
	}
	return (len);
}

char	*my_strndup(char *source, int n)
{
	char	*res;
	int		i;

	res = malloc(n + 1);
	if (res == 0)
		return (0);
	i = 0;
	while (i < n)
		res[i++] = *source++;
	res[i] = 0;
	return (res);
}

char	**ft_split_whitespaces(char *str)
{
	char	**res;
	int		i;
	char	*iter;
	char	**dest;

	i = 0;
	iter = str;
	while (*iter != 0)
	{
		i += 0 != my_spaced_strlen(iter);
		iter += my_spaced_strlen(iter);
		iter += *iter != 0;
	}
	res = malloc((i + 1) * sizeof(char*));
	iter = str;
	dest = res;
	while (*iter != 0)
	{
		if (my_spaced_strlen(iter) > 0)
			*dest++ = my_strndup(iter, my_spaced_strlen(iter));
		iter += my_spaced_strlen(iter);
		iter += *iter != 0;
	}
	*dest = 0;
	return (res);
}
==== main -f1=ft_param_to_tab.c -f2=split_whitespaces.c ====
#include "ft_stock_par.h"
struct s_stock_par *ft_param_to_tab(int ac, char **av);
int main(int argc, char** argv)
{
	if (argc == 0)
		return 1;
	struct s_stock_par* params = ft_param_to_tab(argc, argv);
	while (params->str != 0)
	{
		printf("%d,%s,%s, is_duped? %d\n", params->size_param, params->str, params->copy, params->str != params->copy);
		char** words = params->tab;
		while (*words != 0)
		{
			printf("'%s',", *words);
			words++;
		}
		printf("\n");
		params++;
	}
}
==== check -t ====
%tests = (
	"$program" => length($program) . ",$program,$program, is_duped? 1\n'$program',\n",
	"$program 'asdf qwer'" => length($program) . ",$program,$program, is_duped? 1\n'$program',
9,asdf qwer,asdf qwer, is_duped? 1\n'asdf','qwer',\n",
	"$program ' asdf qwer ' ''" => length($program) . ",$program,$program, is_duped? 1\n'$program',
11, asdf qwer , asdf qwer , is_duped? 1\n'asdf','qwer',
0,,, is_duped? 1\n\n",
);
====


=end comment
=cut

