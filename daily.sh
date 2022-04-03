#!/bin/bash

#x: print the command before excute it
#e: once a command fail (return no zero)
#u: when using undefined variable, exit
#o pipefail: once a single pipe fail exit
set -xeuo pipefail


#更新软件源并更新软件
sudo pacman -Syu

gitUp(){
    (path=$1
    cd "$path"
    git pull
    git gc)
}
cd Reps
#所有git仓库都放在~/Reps目录下 统一更新, 文件名X开头表示拒绝更新
for rep in `ls|ack -v "^X.*$"`
do
    echo "upgrade github rep:$rep"
    gitUp $rep
done
vim +PlugUpdate +quit +quit
conda update --all -y
conda clean -p
conda clean -y --all
