# 42-moulinette-auto-test


A tool for quickly test solutions for the piscine exercises.




## Usage
1. Clone 42-moulinette-auto-test
2. Go inside 42-moulinette-auto-test
4. Run `./run.sh <day_repo> <day_number>`<br>

## gh repo
``` (base) potz-pop@pop-os:~/piscine/c05$ gh repo create
? What would you like to do? Push an existing local repository to GitHub
? Path to local repository .
? Repository name c05
? Description c05
? Visibility Private
✓ Created repository potaSasta/c05 on GitHub
? Add a remote? Yes
? What should the new remote be called? origin
✓ Added remote git@github.com:potaSasta/c05.git
? Would you like to push commits from the current branch to "origin"? Yes
```


## Example workflow
In your local 42london-moulinette-auto-test folder enter `./run.sh <git_repo> <project_number>`

### e.g:
`./run.sh git@github.com:potaSasta/c05.git 05`

you should get output similar to this;


```Git url arg: git@github.com:potaSasta/c05.git
Day arg: 05
<---->
Start git clone
Cloning into 'day05'...
remote: Enumerating objects: 24, done.
remote: Counting objects: 100% (24/24), done.
remote: Compressing objects: 100% (11/11), done.
remote: Total 24 (delta 8), reused 24 (delta 8), pack-reused 0
Receiving objects: 100% (24/24), 1.33 MiB | 2.19 MiB/s, done.
Resolving deltas: 100% (8/8), done.
Done git clone
<---->
Start spawn.pl

preparing ex00/ft_iterative_factorial
mirroring into work/ex00/ft_iterative_factorial.c
main at work/ex00/main.c
check.pl at work/ex00/check.pl

preparing ex01/ft_recursive_factorial
mirroring into work/ex01/ft_recursive_factorial.c
main at work/ex01/main.c
check.pl at work/ex01/check.pl

preparing ex02/ft_iterative_power
mirroring into work/ex02/ft_iterative_power.c
main at work/ex02/main.c
check.pl at work/ex02/check.pl

preparing ex03/ft_recursive_power
mirroring into work/ex03/ft_recursive_power.c
main at work/ex03/main.c
check.pl at work/ex03/check.pl

preparing ex04/ft_fibonacci
mirroring into work/ex04/ft_fibonacci.c
main at work/ex04/main.c
check.pl at work/ex04/check.pl

preparing ex05/ft_sqrt
mirroring into work/ex05/ft_sqrt.c
main at work/ex05/main.c
check.pl at work/ex05/check.pl

preparing ex06/ft_is_prime
mirroring into work/ex06/ft_is_prime.c
main at work/ex06/main.c
check.pl at work/ex06/check.pl

preparing ex07/ft_find_next_prime
mirroring into work/ex07/ft_find_next_prime.c
main at work/ex07/main.c
check.pl at work/ex07/check.pl
invalid exercise name =begin comment at ./spawn.pl line 282.
End spawn.pl
<---->
Start build.sh
building work/ex00/main
building work/ex01/main
building work/ex02/main
building work/ex03/main
building work/ex04/main
building work/ex05/main
building work/ex06/main
building work/ex07/main
End build.sh
<---->
Start verify.sh
./tools/verify.sh: 3: norminette: not found
End verify.sh
<---->
Start check_all.sh
!!!! ERROR in work/ex00/main (line 6): '13! (1932053504 vs 0) -> 0'
!!!! ERROR in work/ex01/main (line 6): '13! (1932053504 vs 0) -> 0'
work/ex02/main good!
!!!! ERROR in work/ex03/main: expected 8 lines, got 0
work/ex04/main good!
work/ex05/main good!
work/ex06/main good!
work/ex07/main good!
End check_all.sh
<---->
Start rm -rf day05
Done rm -rf day05
<---->
Start rm -rf work
Done rm -rf work
<---->
Start rm -rf tools
Done rm -rf tools
```


### Note the errors;
```
!!!! ERROR in work/ex00/main (line 6): '13! (1932053504 vs 0) -> 0'
!!!! ERROR in work/ex01/main (line 6): '13! (1932053504 vs 0) -> 0'
work/ex02/main good!
!!!! ERROR in work/ex03/main: expected 8 lines, got 0
```
ex00,01 and 03 definitley wont pass, the others MIGHT


### ft_putchar
if your file contains a definition of ft_putchar remove it and add the protoype (simplest way is comment the body of putchar and add a ; on the end of the declaration) or you can rename it throughout your code.
Basically these tests are compiled with a file containing ft_putchar so the declarations clash
