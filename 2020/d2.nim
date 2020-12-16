import tables, strutils, sequtils

var
  p1 = 0
  p2 = 0
  lines = toSeq("02.txt".lines)
for line in lines:
  # 5-6 s: zssmssbsms
  var 
    words = line.strip().split()
    # lo,hi = [int(x) for x in words[0].split('-')]
    lh = words[0].split('-').map(parseInt)
    (lo, hi) = (lh[0], lh[1])
#   ch_req = words[1][0]
    ch_req = words[1][0]
#   password = words[2]
    password = words[2]
#   counts = defaultdict(int)
    counts:CountTable[char]

#   for ch in password:
#       counts[ch] += 1
  for ch in password:
    counts.inc ch
#   if lo <= counts[ch_req] <= hi:
#       p1 += 1
  if counts[ch_req] in lo..hi:
    inc p1
#   if (password[lo-1]==ch_req) ^ (password[hi-1]==ch_req):
#       p2 += 1
  if password[lo-1]==ch_req xor password[hi-1]==ch_req:
    inc p2
# print(p1)
# print(p2)
echo p1
echo p2