5. Write a Lex program to count the number of words and lines in a given file or program.
# ✅ **LEX Program: Count Words and Lines**

Save this as **count.l**

```lex
%{
int word_count = 0;
int line_count = 0;
%}

%%

[ \t]+          ;              /* Ignore spaces/tabs */
\n              { line_count++; }
[A-Za-z0-9_]+   { word_count++; }

.               ;              /* Ignore other characters */

%%

int main() {
    yylex();
    printf("Total Lines : %d\n", line_count);
    printf("Total Words : %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}
```

---

# ✅ **How It Works**

| Pattern         | Action                                     |
| --------------- | ------------------------------------------ |
| `[ \t]+`        | Skip spaces/tabs                           |
| `\n`            | Count each newline as a line               |
| `[A-Za-z0-9_]+` | Count any sequence of characters as a word |
| `.`             | Ignore everything else                     |

---

# 🛠️ **To Compile and Run**

1. Generate C code:

```
lex count.l
```

2. Compile using gcc:

```
gcc lex.yy.c -o count
```

3. Run the program with a file:

```
./count < filename.txt
```

---
