from sys import argv

if len(argv) < 2:
    print('No arguments')
    exit()

def invalid_argument():
    print("Invalid Argument")

def show_permitions():
    print("The permitions are:")

string = argv[1]

permitions = {
    "---" : "Sem permissões",
    "--x" : "Execução",
    "-w-" : "Escrita",
    "-wx" : "Escrita e Execução",
    "r--" : "Leitura",
    "r-x" : "Leitura e Execução",
    "rw-" : "Leitura e Escrita",
    "rwx" : "Leitura, Escrita e Execução"
}

permitions_index = [
    "---",
    "--x",
    "-w-",
    "-wx",
    "r--",
    "r-x",
    "rw-",
    "rwx"
]

length = len(string)

if length == 3:
    key = list(permitions)
    for nbr in string:
        if not nbr.isdigit() and nbr not in "01234567":
            invalid_argument()
            exit()

    show_permitions()
    for code in string:
        print(f'{key[int(code)]}', end=' ')

    print()
    for desc in string:
        print(f'{permitions[key[int(desc)]]}')

elif length == 9:
    codes = []
    for c in range(3):
        code = ''
        for i in range(3):
            code += string[i + (c * 3)]
        codes.append(code)
    
    for code in codes:
        if code[0] != 'r' and code[0] != '-':
            invalid_argument()
            exit()
        if code[1] != 'w' and code[1] != '-':
            invalid_argument()
            exit()
        if code[2] != 'x' and code[2] != '-':
            invalid_argument()
            exit()

    show_permitions()
    for code in codes:
        print(f'{permitions_index.index(code)}', end = '')
    print()
    for code in codes:
        print(f'{permitions[code]}')

else:
    invalid_argument()

