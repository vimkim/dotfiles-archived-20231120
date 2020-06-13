import sys
import os
import re


def main():
    iPattern = re.compile("^i.*$")
    files = [f for f in os.listdir('.') if os.path.isfile(f)]

    for f in files:
        if iPattern.match(f):
            print("Input file:", f)
            #sys.argv = ['main.py', f]
            #exec(open('main.py').read())
            os.system("python main.py " + f)


if __name__ == "__main__":
    main()