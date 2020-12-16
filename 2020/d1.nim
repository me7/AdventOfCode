import strutils, sequtils
var 
# X = [int(line) for line in fileinput.input()]
    X = toSeq(stdin.lines).map(parseInt)
# n = len(X)
    n = high(X)
# for i in range(n):
for i in 0..n:
#   for j in range(i+1, n):
    for j in i+1..n:
#       if X[i]+X[j]==2020:
        if X[i]+X[j]==2020:
            echo("Part 1:", X[i]*X[j])
#           print('Part 1:', X[i]*X[j])
#       for k in range(j+1, n):
        for k in j+1..n:
#           if X[i]+X[j]+X[k]==2020:
            if X[i]+X[j]+X[k]==2020:
#               print('Part 2:', X[i]*X[j]*X[k])
                echo("Part 2:", X[i]*X[j]*X[k])
