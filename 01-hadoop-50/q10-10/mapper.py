import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    f1 = ""
    f2 = ""
    line = line.strip()
    splits = line.split("\t")
    f1 = splits[0]
    f2 = splits[1]
    for i in f2.split(","):
        print(i + "\t" + f1)  