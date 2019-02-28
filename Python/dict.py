import sys

args = [i.split('-')[1:] for i in sys.argv[1:]]

def help():
    print("you got help!")

flags = {
    'help': lambda: help()
}

for flag in args:
    flags[flag[0]]()

