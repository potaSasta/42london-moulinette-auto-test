

=begin comment

mising ex05 ft_list_push_strs

vvv possibly similar testcase for rework vvv

ex05 -N -f1=ft_list_push_params.c -f2=ft_list.h
lol hi
main -f=ft_list_push_params.c ====
#include "ft_list.h"

t_list *ft_list_push_params(int ac, char **av);

t_list* ft_create_elem(void* data)
{
	t_list* item = malloc(sizeof(t_list));
	item->next = NULL;
	item->data = data;
	return (item);
}

#define CE(data) ft_create_elem(data)
#define CL(list) crap_a_list(list)

void crap_a_list(t_list* list)
{
	for (; list != 0; list = list->next)
		printf("%s,", (char*)list->data);
	printf("\n");
}

int main(int argc, char** argv)
{
	t_list* list = ft_list_push_params(argc, argv);
	CL(list);
}
==== check -t ====
%tests = (
	"$program" => "\n",
	"$program asdf" => "asdf,\n",
	"$program asdf qwer" => "qwer,asdf,\n",
	"$program asdf qwer zxcv" => "zxcv,qwer,asdf,\n",
	"$program ''" => ",\n",
	"$program 15 '' 25" => "25,,15,\n",
	"$program wat" => "wat,\n",
);
====


=end comment

=cut





=begin comment

missing testcases for ex16-17

=end comment

=cut