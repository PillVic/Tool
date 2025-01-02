#!/bin/env zsh

#desc 系统例行任务脚本

#x: print the command before excute it
#e: once a command fail (return no zero)
#u: when using undefined variable, exit
#o pipefail: once a single pipe fail exit
set -xeuo pipefail

#限制日志缓存
sudo journalctl --vacuum-size=500M

yay -Syu

gitUp(){
    repPath=$1
    cd "${repPath}"
    echo "rep ${repPath}"
    git pull
    git gc
}
#all repository  in ~/Reps
for rep in $(cd ~/Reps && fd -ad 1)
do
    gitUp "${rep}"
done

#vim plug update
vim +PlugUpgrade +PlugUpdate +quit +quit

#后面指令会大量打印无关内容,直接关闭
set +x
#activate miniconda
source ~/.miniconda3/bin/activate
conda update --all -y
conda clean --all -y
