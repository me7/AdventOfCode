# import fileinput
import strutils, sequtils

var 
# slopes = [(1,1),(3,1),(5,1),(7,1),(1,2)]
  slopes = [(1,1),(3,1),(5,1),(7,1),(1,2)]
# G = []
  G:seq[seq[char]]

# for line in fileinput.input():
#     G.append(list(line.strip()))p
for line in lines("03.txt"):
  G.add toSeq(line.strip)
# ans = 1

var ans = 1
# for (dc,dr) in slopes:
for (dc, dr) in slopes:
#     r = 0
#     c = 0 
#     score = 0
  var r, c, score = 0
#     while r < len(G):
  while r < len(G):
#         c += dc
#         r += dr
    c += dc
    r += dr
#   if r<len(G) and G[r][c%len(G[r])]=='#':
#     score += 1
    if r<G.len and G[r][c mod len(G[r])]=='#':
      inc score
# ans *= score
  ans *= score
# if dc==3 and dr==1:
#   print(score)
  if dc==3 and dr==1:
    echo score
# print(ans)
echo ans
