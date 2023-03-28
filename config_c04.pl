ex00
int ft_strlen(char *str)
main_basic ====
int main()
{
	printf("%d,%d,%d", ft_strlen("asdf"), ft_strlen("qwerty"), ft_strlen("zxc0zxc"));
	return 0;
}
====
check_basic -e ====
$expected = '4,6,7';
====
main_empty ====
int main()
{
	printf("%d", ft_strlen(""));
	return 0;
}
====
check_empty -e ====
$expected = '0';
====



ex01
ft_putstr(char *str)
main -m ====
ft_putstr("asdf");
ft_putstr(" qwerty\n");
ft_putstr("zxcv");
==== check -e ====
$expected = "asdf qwerty\nzxcv";
====


ex02
ft_putnbr(int nb)
main_basic -m ====
ft_putnbr(123456);
==== check_basic -e ====
$expected = '123456';
==== main_negative -m ====
ft_putnbr(-987654321);
==== check_negative -e ====
$expected = '-987654321';
==== main_zero -m ====
ft_putnbr(0);
==== check_zero -e ====
$expected = '0';
==== main_intmax -m ====
ft_putnbr(2147483647);
==== check_intmax -e ====
$expected = '2147483647';
==== main_intnmax -m ====
ft_putnbr(-2147483648);
==== check_intnmax -e ====
$expected = '-2147483648';
====


ex03
int ft_atoi(char *str)
main_basic -p -m ====
$code = 'int res; int exp;';
my @tests = qw/ 0 15 -25 12345 987654321 -34567 2147483647 -2147483648 /;
foreach (@tests) {
	$code .= "res = ft_atoi(\"$_\"), exp = $_;\n";
	$code .= "printf(\"ft_atoi('$_') ($_ vs %d) -> %d\\n\", res, res == exp);\n";
}
==== check_basic -l=6 ====
==== main_junk -m ====
TEST(ft_atoi("\t\n\v\f\r +256"), 256);
TEST(ft_atoi("256a99999"), 256);
==== check_jump -l=2 ====
====

ex04
ft_putnbr_base(int nbr, char* base)
main_basic -m ====
ft_putnbr_base(40, "0123456789abcdef");
==== check_basic -e ====
$expected = "28";
==== main_basic2 -m ====
ft_putnbr_base(31, "0123456789abcdef");
==== check_basic2 -e ====
$expected = "1f";
==== main_binary -m ====
ft_putnbr_base(15, "01");
==== check_binary -e ====
$expected = '1111';
==== main_negative -m ====
ft_putnbr_base(-15, "0123456789");
ft_putnbr_base(-16, "01");
==== check_negative -e ====
$expected = '-15-10000';
==== main_intmax -m ====
ft_putnbr_base(2147483647, "0123456789abcdef");
ft_putnbr_base(-2147483648, "0123456789abcdef");
==== check_intmax -e ====
$expected = '7fffffff-80000000';
====


ex05
int ft_atoi_base(char* str, char* base)
main -p -m ====
my %tests = (
	_15_0123456789 => 15,
	_3f_0123456789abcdef => 63,
	_a_0a => 1,
	'_-15_0123456789' => -15,
	'_-111_01' => -7,

	_a_0 => 0,
	_1_012341234 => 0,
	'_1_01234+' => 0,
	_5_01234 => 0,
	__01234 => 0,
);
foreach (sort keys %tests) {
	my (undef, $str, $base) = split '_';
	$code .= "TEST(ft_atoi_base(\"$str\", \"$base\"), $tests{$_});\n";
}
==== check -l=10 ====
====
