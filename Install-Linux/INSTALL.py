import basic_install
import full_install


def install():
    while True:
        is_basic = input("Fazer instalacao basica? [s/n]: ").lower()
        if is_basic == 's' or is_basic == 'n':
            break
    if is_basic == 's':
        basic_install.install()
    else:
        full_install.install()

    with open('', 'r') as fd:
        except_file = fd.read()
    while True:
        print('''* 0 * exit *
* 1 * read exception file *''')
        op = input('choose: ')
        if op == '0':
            break
        if op == '1':
            print(except_file)


if __name__ == '__main__':
    install()
