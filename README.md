# Chmod

This is a short demo for how to use binary operator works, by example of `chmod` in linux.

|chmod number| name |
|-|-|
|7 | read, write, execute |
|6 | read, write          |
|5 | read,        execute |
|4 | read,                |
|3 |       write, execute |
|2 |       write,         |
|1 |              execute |
|0 |                      |

It's inspired by this Stack Overflow Answer: [What does typedef enum syntax like '1 << 0' mean?](https://stackoverflow.com/a/17893748/10172299)

* Using `<<` (Left shift): to generate case value
* Using `|`   (OR)         : to get `[Mod]` associated number 
* Using `^`   (XOR)       : to check value is the same, without using `==`
* Using `&`   (AND)       : to filter `Mod.Value` out of binary.
