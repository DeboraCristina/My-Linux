def get_string_code_permissions_linux(input_permissions, human=False):
    binary_permissions = bin(int(input_permissions, 8))[2:].zfill(9)
    permissions = {
        7: 'rwx',
        6: 'rw-',
        5: 'r-x',
        4: 'r--',
        3: '-wx',
        2: '-w-',
        1: '--x',
        0: '---'
    }
    result = [permissions[int(binary_permissions[i:i+3], 2)] for i in range(0, 9, 3)]
    if human:
        result = ';'.join(result)
        result = result.replace('r', 'read ').replace('w', 'write ').replace('x', 'execute ') \
            .replace('-', '')[:-1]
    return result


def get_digit_code_permissions_linux(input_permissions, human=False):
    permissions = [
        '---',
        '--x',
        '-w-',
        '-wx',
        'r--',
        'r-x',
        'rw-',
        'rwx',
    ]
    input_permissions = [input_permissions[index:index+3] for index in range(0, 9, 3)]
    converted_permissions = [permissions.index(permission) for permission in input_permissions]
    result = ''
    for permission in converted_permissions:
        result += str(permission)
    return result

