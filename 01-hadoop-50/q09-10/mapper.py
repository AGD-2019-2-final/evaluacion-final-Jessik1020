import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
      #line = line[:-1]
      f = line.split()[0]
      f1 = line.split()[1]
      f2 = line.split()[2]
      f2=f2.zfill(3)
      sys.stdout.write("{}\t{}\t{}\t{}\n".format(f2, f, f1, int(f2)))