import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    for line in sys.stdin:
        f1, f2, f3, f4= line.split("\t")
        sys.stdout.write("{}\t{}\t{}".format(f1,f3,f4))