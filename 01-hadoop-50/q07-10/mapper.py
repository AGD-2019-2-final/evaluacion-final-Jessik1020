import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        f1 = line.split( )[0]
        f2 = line.split( )[1]
        f3 = int(line.split( )[2])
        f4 = "{:03.0f}".format(f3)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(f1,f4,f2,f3))