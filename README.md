# Bash Scripts: Variables, Arguments and Conditional Statements

Lab work for the Operating Systems course
Ala-Too International University, IT & Business College (2026–2027)

Author: _your name_

## Contents

| Script | Description | Skills |
|---|---|---|
| greet.sh | Greets a user and checks whether they are an adult | arguments, $#, if/else, -ge |
| evenodd.sh | Tells whether a number is even or odd | arithmetic $(( )), % |
| inspect.sh | Shows whether a path is a file or a directory, its size and readability | file tests -e -d -r, wc -c |
| calc.sh | Mini calculator (+ - x /) | case, exit codes |
| sysreport.sh | System report tool with modes basic, disk, user, mem | everything above, command substitution |

## Requirements

- Linux with Bash (sysreport.sh uses uptime -p, ps --no-headers and free, which are not available on macOS)

## How to run

chmod +x *.sh        # make the scripts executable (needed once after download)
./greet.sh Aida 20
If a script fails with bad interpreter, the file probably has Windows line endings (CRLF):

sed -i 's/\r$//' *.sh
## Usage and examples

### greet.sh

$ ./greet.sh Aida 20
Hello, Aida!
You are an adult.
$ ./greet.sh Bek 15
Hello, Bek!
You are a minor.
$ ./greet.sh
Usage: ./greet.sh <name> <age>
### evenodd.sh

$ ./evenodd.sh 7
7 is odd
$ ./evenodd.sh 10
10 is even
### inspect.sh

$ ./inspect.sh /etc/passwd
File, 1111 bytes
Readable
$ ./inspect.sh /home
Directory
Readable
$ ./inspect.sh /nope
Not found: /nope
### calc.sh

The multiplication operator is x because the shell expands * into file names before the script starts.

$ ./calc.sh 10 + 5
15
$ ./calc.sh 6 x 7
42
$ ./calc.sh 8 / 0
Division by zero
### sysreport.sh

./sysreport.sh [basic|disk|user|mem] [directory]
| Mode | What it prints |
|---|---|
| basic (default) | kernel, architecture, uptime |
| disk [dir] | disk usage of dir (default /) and status: OK / WARNING (>= 70%) / CRITICAL (>= 90%) |
| user | home directory, shell, process count, warning if running as root |
| mem | total, used and available memory in MB, with the same status levels |

## Exit codes

| Script | Code | Meaning |
|---|---|---|
| all | 1 | wrong number of arguments |
| inspect.sh | 2 | path does not exist |
| calc.sh | 2 | unknown operator |
| calc.sh | 3 | division by zero |
| sysreport.sh | 2 | unknown mode |
| sysreport.sh | 3 | not a directory |
| all | 0 | success |

Check the exit code of the last command with echo $?.

## Debugging

bash -x script.sh    # trace every command
bash -n script.sh    # check syntax only
