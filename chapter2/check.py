# -*- coding:utf-8 -*-
#!/usr/bin/python
from __future__ import division
import re
import os
import sys
import subprocess

num = 97
chapter = " 2-"
total = range(1, num)
finished, unfinished = [], []

tail = [".scm", ".org", "-1.scm", "-2.scm"]

for x in total:
    head = str(x)
    ls = "ls" + chapter
    cmd = []
    flag = False
    for y in tail:
        cmd.append(ls + head + y)
    for z in cmd:
        token = z[3:]
        result = subprocess.check_output(z + "; exit 0", 
                                         stderr = subprocess.STDOUT,
                                         shell = True)
        if token == result.strip():
            finished.append(x)
            flag = True
            break
    if flag == False:
        unfinished.append(x)
        
percentage = len(finished) / len(total)

print "Finished: ", finished
print "Unfinished: ", unfinished
print "Completed: " + str(percentage * 100) + "%"
