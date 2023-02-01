from sys import *

BRANCO = '\033[1;97m'
VERDE = '\033[1;92m'
AMARELO = '\033[1;93m'
NULO = '\033[0m'

if len(argv) < 2:
    print(f"{BRANCO}Sem Argumentos{NULO}")
else:
    for i in range(1, len(argv)):
        print(f"{BRANCO}O tamanho de {VERDE}\"{argv[i]}\"{BRANCO} é {AMARELO}{len(argv[i])}.{NULO}")
