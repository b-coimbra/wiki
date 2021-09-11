import os

class Term:
    def __init__():
        self.size = size()

    def size():
        [int(i) for i in os.popen('tput cols && tput lines').read().strip().split("\n")]

    def width():
        int(os.popen('tput cols').read())

    def height():
        int(os.popen('tput lines').read())

class Render:
    def __init__(self, current_line):
        self.term = Term
        self.cline = current_line

        self.width  = self.term.width  - 2
        self.height = self.term.height - 2

    def clear():
        os.system('clear')

    def line(corner = '+', char = '-'):
        print(corner)

    def cols(self):
        for i in range(1, self.height):
            line('|', ' ', int(i))

render = Render
print(render.cols())

