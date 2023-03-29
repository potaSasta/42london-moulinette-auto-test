

=begin comment



ex07
ft_sort_wordtab(char** tab)
main ====
int main(int argc, char** argv)
{
	if (argc < 1)
		return 0;
	ft_sort_wordtab(argv + 1);
	for (char** iter = argv + 1; *iter != 0; iter++)
		printf("%s,", *iter);
}
==== check -t ====
%tests = (
	"$program" => '',
	"$program a" => 'a,',
	"$program c b a" => 'a,b,c,',
	"$program b c a" => 'a,b,c,',
	"$program a c b" => 'a,b,c,',
	"$program c b a d" => 'a,b,c,d,',
	"$program a b" => 'a,b,',
	"$program b a" => 'a,b,',
	"$program asdf asde asdd" => 'asdd,asde,asdf,',
);
====




ex08
ft_advanced_sort_wordtab(char** tab, int(*cmp)(char*, char*))
main ====

int my_reverse_strcmp(char* s1, char* s2)
{
	while (*s1 == *s2 && *s1 != 0)
	{
		s1++;
		s2++;
	}
	return *s2 - *s1;
}

int main(int argc, char** argv)
{
	if (argc < 1)
		return 1;
	ft_advanced_sort_wordtab(argv + 1, my_reverse_strcmp);
	
	for (char** iter = argv + 1; *iter != 0; iter++)
		printf("%s,", *iter);
}
==== check -t ====
%tests = (
	"$program" => '',
	"$program a" => 'a,',
	"$program c b a" => 'c,b,a,',
	"$program b c a" => 'c,b,a,',
	"$program a c b" => 'c,b,a,',
	"$program c b a d" => 'd,c,b,a,',
	"$program a b" => 'b,a,',
	"$program b a" => 'b,a,',
	"$program asdf asde asdd" => 'asdf,asde,asdd,',
);
====


=end comment

=cut









