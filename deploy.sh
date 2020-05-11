#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

git add .

git commit -m "A Rich and Meaningful Day 📝"

git push origin master

# 生成静态文件
yarn run build

# 进入生成的文件夹
cd blog

# 如果是发布到自定义域名
echo 'summer1874.top' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io  USERNAME=你的用户名 
git push -f git@github.com:summer1874/summer1874.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>  REPO=github上的项目
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -