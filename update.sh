#/bin/sh

for d in `ls -AF ./ | grep /`
do
    if [ -d "$d/.git" ]; then
        echo "******************** updating $d *************************"
        pushd $d
        git stash
        git pull
        git stash pop
        popd
    fi
done
