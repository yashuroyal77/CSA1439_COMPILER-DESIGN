%{
    int positive_count = 0;
    int negative_count = 0;
%}

DIGIT       [0-9]
SIGN        [-+]

%%
{SIGN}?{DIGIT}+     { /* Match positive or negative numbers */
                        int num = atoi(yytext);
                        if (num > 0) {
                            positive_count++;
                        } else if (num < 0) {
                            negative_count++;
                        }
                    }

\n              ; /* Skip newline character */
[ \t]           ; /* Skip whitespaces */

.               printf("Invalid input\n");
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Positive Count: %d\n", positive_count);
    printf("Negative Count: %d\n", negative_count);
    return 0;
}
