#!/bin/python3
import os
from collections import deque
import re

def neols(path):
    return deque(map(lambda x:path+"/"+x, os.listdir(path)))

def defaultFilter(fileName):
    return (not os.path.islink(fileName)) and re.match(".*\.git$", fileName) == None

#dfs traversal the directory and operate all the target file
def dfs(path, judge=lambda x:True, foo=print, ftr=defaultFilter):
    #path: the dfs start path
    #judge(absolutePath): function judge whether execute functions foo, 
    #foo(absolutePath): operate the target file
    #ftr(absolutePath): only enter the wanted directory
    stk = neols(path)
    while len(stk)!=0:
        t = stk.pop()
        if os.path.isdir(t) and ftr(t):
            for i in neols(t):
                stk.append(i)
        if judge(t):
            foo(t)
    return 
    
if __name__ == "__main__":
    dfs(os.getcwd())
