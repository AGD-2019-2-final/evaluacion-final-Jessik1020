import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
current = None
num= []

for line in sys.stdin:
    k, v = line.split("\t")
    v = int(v)
    if k == current:
        num.append(v)
    else:
        if current is not None:
            num.sort()
            print(current + "\t" + str(num).replace("[", "").replace("]", "").replace(" ", ""))
        current = k
        num = [v]
num.sort()
print(current + "\t" + str(num).replace("[", "").replace("]", "").replace(" ", ""))