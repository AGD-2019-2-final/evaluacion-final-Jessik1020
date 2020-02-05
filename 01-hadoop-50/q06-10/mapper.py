import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    
    for line in sys.stdin:
        letra=line.split(' ')[0]
        cantidad=line.split(' ')[6]
        cantidad=float(cantidad)
        sys.stdout.write("{}\t{}\n".format(letra,cantidad))
