---
title: "Flow control"
---

Statements
==========

Definition
----------

> Statements are fragments of a C++ program that are executed in sequence.

---

Examples of `statements` are:

```cpp
int i = 0;
i = 1;
std::cout << "The value is: " << i << '\n';
foo();
; // Empty statement
```

---

They can also be compound. For that you should enclose in braces a series of
statements:

The following is a single compound statement:

```cpp
{
    int i = 0;
    std::cout << "The value is: " << i << '\n';
}
```

Selection statements
====================

Use case
--------

> Selection statements choose between one of several flows of control.

---

This means that they, based on some condition or value, change which statements
will be executed.

There are two types of selection statements:

## `if`

This one picks one of two paths based on a boolean condition.

---

### Structure

```cpp
if (condition)
    statement
```

If the condition is `true`, the statement will be executed.

---

You can add an `else` clause to have an statement executed in case that the
condition is `false`.

```cpp
if (condition)
    statement
else
    statement
```

## Example

[Try it online!](https://tio.run/##hVNNbxoxED2XXzGihyYSIXBNKIfccumhyqVSD3i9w2LhHa/sMRRF/HY6swtbIbKpD7b2Y968N@/ZNs2D9Yaq01dH1ucSYeFC4oimXp4cMdTG0d39@whkuTXcccx4D92zrsTl05MNmWGxgPHbxiXwjhD2znsoEPAP2sxY/qbxc1t0HF1jDSD9xBrrAiPwxrBseABrSBGTo8rLwYblH@IEHEIPP7qFepGzDPRNd3DcIe7NAYyXPUFOCO/HFqGntjY@DXJ7QWu0SLBEbu2SR1MKq57EbcmvkGEfsi@lu6Ot7udByUmB@zlNoJCSFvma0Xw2PPYfWUeVwETBqxvvrGOvA0uCCGJjgCIEYUnpIx9m/zG09VJJfuTn8HhWs5Wqk/YYm4hKxSRoJzuR2XsIYmsEOpMf93BXa3xJkqblhr0k1MF3mD33YjoujmC5BDcsTA3RQOEOCTZmh2ADlY5dIDVmi5o5MEWQL4FwCm@amiGOfa0KFu3r7CWVYDdot8pKseR1BGM5i/QDVNpyCO4g5Mx5MNN/mgG9RnX05fERLvyroI0Uf/VKTeYVsClkvFRKd7nYnY65/mT0TRQGGCcQIkgedm2IsW740KIqFCZu4zn9LMrqSULschxIBIlKpb2PgeVyhho16NXlsg3bq7m6aO3NPZ5O878 "C++ (clang) – Try It Online")

## Exercise

---

What will be the output of this program if the user wrote `10`? (Remember that
`&&` is a logical `and`, and `||` is a logical `or`).

```cpp
    if ((false == false) && (false || true)) {
        std::cout << "A\n";
    }

    int i = 0;
    if (std::cin >> i) {
        std::cout << "B\n";
    }

    if (i < 5) {
        std::cout << "C\n";
    }
```

[Try it online!](https://tio.run/##dY1BCoMwEEX3OcXHgphFwS660Rhoe41uQoxlIEYxcVU9e2q1lELxr4aZee/rvj9qq9wjHshpO9YGgjofBqNaGckFtIpcxp8MS6hBljXKeoOqwjpwpCk@u2lCGEbDObb3d3yoi0J3Y4AQSC53l5TrbWabcWkgVMjLb8FGkIOUoH3V9U@1sASB8z5z@2FmFuMpfwE "C++ (clang) – Try It Online")

---

### Extra

You can add the `constexpr` specifier. In that case, the code that will be
compiled will depend on the condition.

---

For example, in this case, if `debug_enabled` is `true`, the logger will work
as expected. If it is `false`, then the function will be empty, and the
overhead of the call will be eliminated in the final executable.

```cpp
void log(const char* t) {
    if constexpr (debug_enabled) {
        std::clog << t;
    }
}
```

You can see that comparing the generated code on both cases
[here](https://godbolt.org/z/86oWq9x49).

## `switch`

This one will pick one of many paths depending on a value. Under the hood, it
is implemented as a jump table.

---

### Structure

```cpp
switch (condition) {
case constexpr_value:
    statements
    break; // break will jump outside of the switch.
           // If you dont add it the execution will fall through
           // to the next cases.
}
```

---

You can add a `default` case, that will be executed if the value from
`condition` doesn't match any of the values you gave it:

```cpp
int i = 10;

// ...

switch (i) {
    case 1:
        // .. Do something
        break;
    case 2:
        // .. Do something else
        break;
    default:
        std::cout << "The value is not in the expected range\n";

}
```

---

### Example

```cpp
std::cout << "Do you want to delete this file? ('Y' for yes, 'N' for no, "
             "'A' for yes to all)\n";

char option = '\0';
std::cin >> option;

switch (option) {
    case 'Y':
        // Delete the file
        break;
    case 'N':
        // Dont delete this file
        break;
    case 'A':
        // Delete the rest of the files
        break;
    default:
        std::cout << "Please select one of ('Y', 'N', 'A'): ";
        // Read again and repeat
}
```

---

### Exercise

---

What will be the output of this program if the user wrote `1`?

```cpp
#include <iostream>

int main(){
    int option = 10;

    switch (option) {
        case 1: 
            std::cout << "A\n";
        case 2:
            std::cout << "B\n";
        default:
            std::cout << "C\n";
    }

    std::cin >> option;

    switch (option) {
        case 1: 
            std::cout << "A\n";
        case 2:
            std::cout << "B\n";
        default:
            std::cout << "C\n";
    }
}
```

[Try it online!](https://tio.run/##1Y/BDoIwEETv/YoNXuBgIh4LNlF/w0tTqm5Sto0s8WD49iqFkHDh7tx25k2yY0LYG6fpEeMOybi@sVCj7/hldauEQGJoNVJefAT8NN4@MHqCE5SHSiS3eyObJ@RTUsDEjjK6s1BKWIyEcyOl8T1DXUN2vlFWrQtHucFfVnxj77p3vFW4LoVhfjfFSKDUPObvdgwixvIL "C++ (clang) – Try It Online")

---

Having a fall through is not usually what we want, that is why the compiler
warns us about it. But there may be cases where we do want for it to fall
through. For those cases, we have the C++17 attribute `[[fallthrough]]`.

---

Taking that into account, the corrected `switch` would be:

```cpp
switch (option) {
    case 1: 
        std::cout << "A\n";
        [[fallthrough]];
    case 2:
        std::cout << "B\n";
        [[fallthrough]];
    default:
        std::cout << "C\n";
}
```

Iteration statements
====================

Use case
--------

> Iteration statements repeatedly execute some code.

## `while` and `do while`

---

### Structure

```cpp
while (condition)
    statement
```

```cpp
do
    statement
while (condition);
```

## `for`

---

### Structure

```cpp
for (init-statement; condition; expression)
    statement
```

Where:

* ***init-statement***: Will initialize the variables used for the ***condition***.
* ***condition***: While this value is true, the loop will execute.
* ***expression***: An expression, that is usually used to change the variables
  that affect ***condition***.

---

### Note

***init-statement***, ***condition*** and  ***expression*** are all optional.
You can omit them to create an infinite loop:

```cpp
for (;;;) {
    std::cout << "I will never stop\n";
}
```

## Jumping out

---

To jump out of the loop you can use *jump statements*. This ones are:

* `break`: Works like in the switch statement, it will completely break out of
  the statement.
* `continue`: Will skip the rest of the inner statement and continue the loop.
* We will see about `return` when we talk about functions, and `goto` will be
  part of the homework.

## Exercise

Predict the output of the following programs:

---

```cpp
int i = 0;
while (i < 10)
    std::cout << i << '\n';
    i++;
```

[Try it online!](https://tio.run/##HYsxDsMgEAT7e8VKKWzLsuS0huQlaRCg5CR8WBiSIvLbCc4WW8zO2m2bbDDyrBcWG4rz0Bz3nLxZ70QsGath6d@R3YBvPQHjhlnR58XBo2doXOeB0LJntyw2lgytm9aqe0in/huPo6KafC5JzvtRfw "C++ (clang) – Try It Online")

---

```cpp
for (int i = 0; i < 20; i += 2) {
    std::cout << i << '\n';
}
```

[Try it online!](https://tio.run/##HYvBCsIwEETv@YoBD62IID22W7/ES0iiLLSbkm68iN8et87lDcObsG3XsHh5tRNLWGpMIM67luTXu3MsitWz9O/M8YxPe@aC/lgZM26TgTD8eZkxmOFg2TWOY8hVQXQohO4h3eS@rSStRexp/Qc "C++ (clang) – Try It Online")

---

And now is your turn to apply everything and do a program. This is what it
should do:

It should read two numbers (`a` and `b`, you can assume that the user will
always input integers, and `a` will always be smaller than `b`).

For the numbers in the range $[a, b)$ it should print the number as text if it
is less than or equal to 9. And if it is bigger, it should print if it is odd
or even.

After that, it should ask the user if he wants to use the program again. (You
can assume that the user will always enter a `y` or a `n`).

---

Line starting with a `>` are user input.

```
> 2 5
two
three
four
Do you want to use the program again? [y/n]
> y
> 9 12
nine
even
odd
Do you want to use the program again? [y/n]
> n
```
