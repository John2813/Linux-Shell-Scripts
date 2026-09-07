# Bash Scripting Core Knowledge Guide

This guide synthesizes key concepts and practical techniques for Bash shell scripting based on example scripts. It covers variable types, string manipulation, control structures, I/O redirection, pipeline processing, function definitions, and conditional testing.

---

### 1. Variables and Data Types

* **Variable Definition and Lifecycle**
  * **Assignment**: Use `var_name="value"`. **Do not place spaces around the `=` sign**.
  * **Referencing**: Use `${var_name}` for unambiguous variable expansion.
  * **Unsetting**: Use `unset var_name` to remove a variable (readonly variables cannot be unset).
  * **Read-only Variables**: Declare using `readonly var_name` or `declare -r var_name` to prevent re-assignment or deletion.

* **Explicit Declarations with `declare`**
  * **Integers**: `declare -i count=100`
  * **Indexed Arrays**: `declare -a array_name=(val1 val2 val3)` (elements separated by spaces).
  * **Associative Arrays (Key-Value Pairs)**: `declare -A assoc_array`, e.g., `assoc_array[key]="value"`.
  * **Exporting Environment Variables**: `export VAR="val"` or `declare -x VAR="val"`.

* **Special and Predefined Variables**
  * `$0`: Name or path of the current script.
  * `$1`, `$2`: First and second positional arguments passed to the script or function.
  * `$#`: Total number of positional arguments.
  * `$*`: All positional arguments concatenated into a single string.
  * `$@`: All positional arguments as separate double-quoted strings.
  * `$$`: Process ID (PID) of the current Shell process.
  * `$?`: Exit status of the last executed command (0 indicates success, non-zero indicates an error).
  * `$-`: Current Shell invocation flags/options.

---

### 2. Advanced String and Array Operations

* **Single Quotes vs. Double Quotes**
  * **Single Quotes (`' '`)**: Strong quoting. All characters are treated literally; variable expansion and escape sequences are disabled.
  * **Double Quotes (`" "`)**: Weak quoting. Allows variable expansion (e.g., `"${var}"`) and command substitution.

* **String Manipulation**
  * **String Length**: `${#var_name}` (counts total characters, including spaces).
  * **Substring Extraction**: `${var:start:length}`, e.g., `${var:1:6}` extracts 6 characters starting from index 1.
  * **Character Location**: `expr index "$var" "sc"` returns the 1-based index of the first matching character from the search set.

* **Array Operations**
  * **Accessing Elements**: `${array[0]}` or `${assoc_array[key]}`
  * **Expanding All Elements**: `${array[@]}` or `${array[*]}`
  * **Array Element Count**: `${#array[@]}` or `${#array[*]}`
  * **Keys of Associative Array**: `${!assoc_array[@]}`

---

### 3. Basic Syntax and Formatting

* **Output and Formatting (`echo` and `printf`)**
  * `echo`: Supports flags like `-n` (omit trailing newline) and `-e` (enable interpretation of backslash escapes).
  * **ANSI Color Codes**: Render styled terminal output using escape sequences like `\033[31m` (foreground/background styling) and `\033[0m` (reset formatting).
  * `printf`: Provides C-style formatted output. Supports field width/alignment (`%-10s`), zero-padding (`%04d`), floating-point precision (`%.2f`), and tabular formatting.

* **Command Substitution and File Inclusion**
  * Command substitution: Use `$(command)` or `` `command` `` to capture output (syntax `$(...)` is preferred).
  * Script sourcing: Include external files via `source ./filename` or `. ./filename`. The target file only requires read permission (`-r`), not execution permission (`-x`).

---

### 4. Operators and Conditional Testing

* **Arithmetic and Increments**
  * **Command Evaluation**: `expr $a + $b` (operators must be space-separated; multiplication requires escape `\*`).
  * **Built-in Arithmetic**: Use `((a++))` or `$((a + b))` for efficient integer evaluation without external subshells.
  * **Assignment Increment**: Use `let num++` or `let num--`.

* **Test Expressions and Conditions**
  * **File Test Operators**:
    * `-e`: Path exists
    * `-f`: Regular file
    * `-d`: Directory
    * `-r` / `-w` / `-x`: Read / Write / Execute permissions
    * `-s`: Non-empty file (size > 0)
  * **Numeric Comparisons**:
    * `-eq` (equal), `-ne` (not equal), `-gt` (greater than), `-ge` (greater or equal), `-lt` (less than), `-le` (less or equal)
  * **String Comparisons**:
    * `=` or `==` (equal), `!=` (not equal)
    * `-z`: String length is zero
    * `-n`: String length is non-zero
  * **Conditional Structures**:
    * `[ EXPRESSION ]`: POSIX standard test block. Logical operators use `!` (NOT), `-a` (AND), `-o` (OR).
    * `[[ EXPRESSION ]]`: Extended test block supporting wildcard pattern matching (e.g., `[[ "$file" == *.log ]]`) and operators `&&` / `||`.
    * `(( EXPRESSION ))`: Dedicated arithmetic evaluation block supporting standard mathematical syntax (e.g., `(( $count > 10 ))`).

---

### 5. Control Flow

* **Branching (`if` / `case`)**
  * `if-elif-else`: Syntax requires `if`, `then`, and closing `fi`. Empty conditional branches are invalid.
  * `case-esac`: Pattern matching syntax. Each pattern ends with `)`, blocks terminate with `;;`, and `*)` acts as the default fallback.

* **Loops (`for` / `while` / `until`)**
  * `for`: Iterates over lists or ranges (e.g., `for i in ${arr[@]}` or `for i in {1..20}`).
  * `while`: Loops as long as the test condition succeeds (returns 0). Infinite loop syntax: `while :` or `while true`.
  * `until`: Loops until the test condition succeeds.
  * **Control Statements**: `break` and `continue` function identically to standard C control constructs.

---

### 6. Functions and Scope

* **Function Definition and Parameter Handling**
  * Syntax: `func_name() { ... }` or `function func_name() { ... }`.
  * **Positional Parameters**: Inside functions, `$1`, `$2` refer to passed arguments, and `$#` represents argument count.
  * **Local Variables**: Declare internal variables using `local` (e.g., `local a="$1"`) to prevent polluting the global scope.
  * **Return Values**:
    * `return`: Sets the function's exit status code (0–255).
    * `echo` / `printf`: Used to pass output back to the caller (captured via command substitution `result=$(func_name)`).

---

### 7. Input/Output Redirection and Pipelines

* **Standard Streams and File Descriptors**
  * `0`: Standard Input (stdin)
  * `1`: Standard Output (stdout)
  * `2`: Standard Error (stderr)

* **Redirection Operators**
  * `>` and `>>`: Redirect stdout to a file (overwrite or append).
  * `<`: Read stdin from a file.
  * `2>file`: Redirect stderr to a file.
  * `> file 2>&1` or `&> file`: Combine stdout and stderr into the same output file.
  * `/dev/null`: Null device used to discard unwanted output streams (e.g., `command > /dev/null 2>&1`).

* **Pipelines (`|`)**
  * Passes stdout of the preceding command directly as stdin to the next command using a FIFO pipe mechanism.
  * Pipe chaining example:
    ```bash
    bash echo.sh | grep Today    # Filter command output for matching lines
    cat output.txt | wc -l       # Count total line numbers
    ```

* **The `tee` Command**
  * Splits an input stream by writing standard input to standard output while simultaneously logging to one or more files.
  * Examples:
    * Standard file write and console output:
      ```bash
      /bin/bash echo.sh | tee output.txt | grep Today
      ```
    * Append mode (`-a` flag):
      ```bash
      echo "System status update" | tee -a log.txt
      ```

* **Here Documents (`<<EOF`)**
  * Embed multiline input directly within a script:
    ```bash
    cat <<EOF "#" "$1" "$target_file" "File "Progress: "\033[31mError: "\033[32mFile "] # #!/bin/bash ### && '$target_file' --- -A -a -e -n -r -z 0.05 1 100%" 2 8. Complete Declare Define EOF Example Invoke Line No Practical Progress SYS_NAME="AdminScript" [ [" [[ ]; ]]; ``` ```bash and argument array associative bar check_and_process check_and_process() command-line declare do done echo else exists fi file for function i if in is local logging missing or pipeline process.log readable.\033[0m" readonly return server_config server_config[host]="127.0.0.1" server_config[port]="8080" simulation sleep specified.\033[0m" target target_file="$1" tee then unreadable." validation variables with { {1..10}; | }>
