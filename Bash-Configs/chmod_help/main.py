from chmodhelp import *
from sys import argv


if __name__ == "__main__":
    try:
        chmod_help(argv[1])
    except Exception:
        chmod_help()
