#!/bin/python3
import os
from collections import deque

def neols(path):
    return deque(map(lambda x:path+"/"+x, os.listdir(path)))

#dfs traversal the directory and operate all the target file
def dfs(path, judge=os.path.isdir, foo=print, ftr=lambda x:True):
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
