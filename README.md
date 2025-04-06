# madhuri_67
# Custom Instruction Recognition Compiler using Flex & Bison

## 📌 Overview

This project demonstrates how to design a simple **custom instruction** by recognizing specific arithmetic patterns using **Flex** (lexer) and **Bison** (parser). Instead of generating standard code for a basic arithmetic expression, this compiler detects a specific pattern and emits a custom instruction.

## 🛠️ What It Does

It parses C-like input such as:

z = a * b + c;
muladd z, a, b, c
muladd destination, operand1, operand2, operand3
destination = (operand1 * operand2) + operand3;


⚙️ How to Build␣␣
1.Generate the parser and lexer:␣␣
---
```
bison -d parser.y

flex lexer.l

gcc parser.tab.c lex.yy.c -o custom_compiler
```
2.Run the compiler on test input:
---
```
echo "z = a * b + c;" | ./custom_compiler
```
3.Output
---
```
Custom instruction: muladd z, a, b, c
```
****Features
Detects and processes the exact expression z = a * b + c;
---
Emits a custom instruction instead of standard IR or assembly

Easily extensible to support more patterns or instructions

***Requirements
1.Flex

2.Bison

3.GCC

