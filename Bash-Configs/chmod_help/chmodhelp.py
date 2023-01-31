from utils.show_messages import *
from utils.help_message import *


def __is_digit_permission(input_permission):
    if len(input_permission) != 3 or not input_permission.isnumeric():
        return False
    for digit in input_permission:
        if not 0 <= int(digit) <= 7:
            return False
    return True


def __is_character_permission(input_permission):
    permissions = ['rwx', 'rw-', 'r-x', 'r--', '-wx', '-w-', '--x', '---']
    if input_permission == '---------':
        return True
    if len(input_permission) != 9 or not input_permission.replace('-', '').isalpha():
        return False
    for index in range(0, 9, 3):
        start = index
        end = index + 3
        permission = input_permission[start:end]
        if permission not in permissions:
            return False
    return True


def chmod_help(input_permission=None):
    if input_permission is None:
        show_table_chmod()
    elif __is_digit_permission(input_permission):
        show_string_permissions(input_permission)
    elif __is_character_permission(input_permission):
        show_digit_permissions(input_permission)
    else:
        show_error_message()
        help_message()
