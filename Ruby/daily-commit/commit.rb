#!/usr/bin/env ruby
# encoding: UTF-8
cmds = <<CMDS
git add file.txt
git commit -m "update"
git push -u origin master
CMDS
cmds.each_line(&(c=[]).method(:<<))
test(?e, '.git') ? ->(*cmds) {cmds.map(&method(:system)); sleep(1)}.(c.to_s) : \
    (File.open('file.txt', 'w'){|f| f << '( ͡° ͜ʖ ͡°)'} && (`git init`;`git remote add origin <repository-name>.git`))