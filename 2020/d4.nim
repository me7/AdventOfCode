# import fileinput
# import re
import strutils, sequtils, tables

# p1 = 0
# p2 = 0
# passport = {} # current passport
var
    p1, p2 = 0
    passport:OrderedTable[string, string]

# def in_range(s, lo, hi):
#     return lo<=int(s)<=hi
proc in_range(s:string, lo, hi: int): bool =
    parseInt(s) in lo..hi

# lines = list(fileinput.input())
var lines = toSeq("04.txt".lines)
# lines.append('')
lines.add ""
# for line in lines:
for l in lines:
#     line = line.strip()
    var line = l.strip
#     if not line:
    if line.len == 0:
#         valid1 = all([f in passport for f in ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']])
        var valid1 = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"].all proc(f:string):bool = passport.hasKey(f)
#         if valid1:
#             p1 += 1
#             valid2 = True
        if valid1:
            inc p1
            var valid2 = true
            if not passport["byr"].in_range(1920, 2002):
                valid2 = false
#             if not in_range(passport['byr'], 1920, 2002):
#                 valid2 = False
            if not passport["iyr"].in_range(2010, 2020):
                valid2 = false
#             if not in_range(passport['iyr'], 2010, 2020):
#                 valid2 = False
            if not in_range(passport["eyr"], 2020, 2030):
                valid2 = false
#             if not in_range(passport['eyr'], 2020, 2030):
#                 valid2 = False
            var ht = passport["hgt"]
            if ht.endsWith("in"):
                if not ht[0..^3].in_range(59, 76):
                    valid2 = false
#             ht = passport['hgt']
#             if ht.endswith('in'):
#                 if not in_range(ht[:-2], 59, 76):
#                     valid2 = False
            elif ht.endsWith("cm"):
                if not ht[0..^3].in_range(150, 193):
                    valid2 = false
#             elif ht.endswith('cm'):
#                 if not in_range(ht[:-2], 150, 193):
#                     valid2 = False
            else: 
                valid2 = false
#             else:
#                 valid2 = False

            var hcl = passport["hcl"]
            var c1 = hcl[0] != '#'
            var c2 = hcl[1..^1].any proc(c:char):bool = c notin toSeq("0123456789abcdef")
            if c1 or c2:
                valid2 = false
#             hcl = passport['hcl']
#             if hcl[0]!='#' or any([c not in '0123456789abcdef' for c in hcl[1:]]):
#                 valid2 = False
            var ecl = passport["ecl"]
            if ecl notin ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]:
                valid2 = false
#             ecl = passport['ecl']
#             if ecl not in ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']:
#                 valid2 = False
            var pid = passport["pid"]
            var pc2 = pid.any proc(c:char):bool = c notin toSeq("0123456789")
            if len(pid) != 9 or pc2:
                valid2 = false
#             pid = passport['pid']
#             if len(pid) != 9 or any([c not in '0123456789' for c in pid]):
#                 valid2 = False
            if valid2:
                inc p2
#             if valid2:
#                 p2 += 1
#         passport = {}
        passport.clear
#     else:
    else:
        # passport.clear
#         words = line.split()
        var words = line.split()
#         for word in words:
        for word in words:
#             k,v = word.split(':')
            var kv = word.split(':')
#             passport[k] = v
            passport[kv[0]] = kv[1]
# print(p1)
echo p1
# print(p2)
echo p2
