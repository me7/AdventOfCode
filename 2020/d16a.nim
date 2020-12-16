import strutils, sequtils, strscans

const ex1 = """class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12""" # 71 = 4 +55 +12

type
  Section = enum Start Mine Nearby
  Rule = tuple
    name: string
    lo1, hi1, lo2, hi2: int
  Rules = seq[Rule]
  Ticket = seq[int]

var
  section: Section
  myTicket: Ticket
  nearbyTickets: seq[Ticket]
  rules: Rules
  validTickets: seq[Ticket]

proc parsefile(src: string) =
  for line in src.splitLines:
    if line == "": continue
    if line == "your ticket:":
      section = Mine
      continue
    if line == "nearby tickets:":
      section = Nearby
      continue


    case section:
      of Start: 
        #class: 1-3 or 5-7
        var r:Rule
        if line.scanf("$+: $i-$i or $i-$i", r.name, r.lo1, r.hi1, r.lo2, r.hi2):
          rules.add r
      of Mine: 
        myTicket = line.split(',').map(parseInt)
      of Nearby: 
        nearbyTickets.add line.split(',').map(parseInt) 
  # echo (myTicket, rules, nearbyTicket)

proc sumInvalidFiled: int =
  proc validField(f: int): bool =
    for r in rules:
      if f in r.lo1..r.hi1 or f in r.lo2..r.hi2:
        return true

  for ticket in nearbyTickets:
    for num in ticket:
      if not num.validField: result += num      

# 45 minutes even know how to write it
readFile("16.txt").parseFile
echo ("Part 1", sumInvalidFiled())