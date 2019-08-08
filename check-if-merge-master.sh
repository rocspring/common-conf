## 更新本地master代码
git pull origin master:master
# 判断是否merge master
n_commit_id=`git rev-parse origin/master`
git_check=`git log --pretty=oneline -n 1000 | grep $n_commit_id`
if [ -n "$git_check" ];then
  echo "检测 merge master 通过"
else
  { echo "Error: 当前代码未merge master，验证不通过" 1>&2; exit 1; }
fi

