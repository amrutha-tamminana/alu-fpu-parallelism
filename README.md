# ALU–FPU Parallelism on ARM Cortex-A76: A Performance Study

This repository contains all the source codes used for benchmarking ALU–FPU parallelism.

---

## Compilation

Each program can be compiled individually using **O3 optimization** as follows:

```bash
gcc -O3 file_name.c -o file_name
```
## Execution Instructions

### Programs that use input from a text file
For the following functions, an **`input.txt` file is already provided** inside each folder:

* **binarysearch**
* **cumm_sum** (cumulative sum)
* **matrix_mul**
* **polynomial evaluation** 

Run them as:

```bash
./file_name < input.txt
```
> **Note:** In some functions more input text files are also present, those are just to check the accuracy of the result. The one with **large inputs are named `input.txt`** (the one that is used for checking time).
> 
> If one wants to check for more inputs, an **input generator c code** is also present through which multiple inputs can be generated.

### factorial
After compilation:

```bash
./file_name
```
Then enter: **`19`** *(**`19`** is the largest factorial supported here without integer overflow.)*

### ncr (n choose r)
After compilation:

```bash
./file_name
```
Then provide: **`n r`** as input.

### primecount
After compilation:

```bash
./file_name
```
Then enter the **limits for prime counting**.

---

## Output

**All programs print both the computed result and the execution time.**

> **Important:** **Matrix multiplication does not print the result matrix**, because large dimensions would produce extremely large output. **Only the timing is shown.**
