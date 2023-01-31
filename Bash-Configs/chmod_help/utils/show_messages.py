from utils.get_permission_linux import *


def format_message(message):
    lines = message.split('\n')
    length_greater_line = 0
    for line in lines:
        if len(line) > length_greater_line:
            length_greater_line = len(line)
    for line in lines:
        index = lines.index(line)
        line = '| ' + line
        lines[index] = line
    for line in lines:
        index = lines.index(line)
        while len(line) <= length_greater_line+1:
            line += ' '
        line += ' |'
        lines[index] = line
    top_bottom_box = '----'
    for i in range(length_greater_line):
        top_bottom_box += '-'
    result = ''
    result += top_bottom_box + '\n'
    for line in lines:
        result += line + '\n'
    result += top_bottom_box
    return result


def show_table_chmod():
    print("""-----  Table Permissions  ------
| 7 . rwx . Read Write Execute |
| 6 . rw- . Read Write         |
| 5 . r-x . Read Execute       |
| 4 . r-- . Read               | 
| 3 . -wx . Write Execute      |
| 2 . -w- . Write              |
| 1 . --x . Execute            |
| 0 . --- . No Permission      |
--------------------------------""")


def show_string_permissions(input_permission):
    permission = ''
    for p in get_string_code_permissions_linux(input_permission):
        permission += p
    human_permission = get_string_code_permissions_linux(input_permission, True)
    message = f'''{input_permission} <-> {permission}
{human_permission}'''
    message = format_message(message)
    print(message)


def show_digit_permissions(input_permission):
    permission = get_digit_code_permissions_linux(input_permission)
    human_permission = get_string_code_permissions_linux(permission, True)
    message = f'''{permission} <-> {input_permission}
{human_permission}'''
    message = format_message(message)
    print(message)


def show_error_message():
    print('''\033[1;91mInvalid Parameter\033[0m''')

