#!/usr/bin/python
import sys
import subprocess

del sys.argv[0]
sys.argv.insert(0,'./prober')


proc = subprocess.Popen(sys.argv,stdout=subprocess.PIPE)
for line in iter(proc.stdout.readline,''):
    s= line.rstrip()
    t=s.split(" = ")
    subprocess.Popen("curl -i -XPOST 'http://localhost:8086/write?db=st' --data-binary 'diff,data=%s value=%s'"%(t[0],t[1]),shell=True)

