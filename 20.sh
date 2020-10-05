#!/bin/sh
for j in {001..129}
do
    Y=$((2017+$(($RANDOM % 1))))
    startm=1
    endm=12
    startd=1
    endd=30
    M=$(($startm+$RANDOM%($endm-$startm+1)))
    #D=$(($RANDOM%31+1))
    D=$(($startd+$RANDOM%($endd-$startd+1)))
    
    bugcnt=$(($RANDOM%15+1))
    echo "$bugcnt"
    #echo "update and deploy firebase function for code.angularjs.org on $M/$D/$Y"
    echo "update and deploy firebase function for code.angularjs.org on $M/$D/$Y" > commit.md
    tt=$(($RANDOM % 12))
    mm=$(($RANDOM % 60))
    ss=$(($RANDOM % 60))
    export GIT_COMMITTER_DATE="$Y-$M-$D $tt:$mm:$ss"
    echo "$Y-$M-$D $tt:$mm:$ss"
    export GIT_AUTHOR_DATE="$Y-$M-$D $tt:$mm:$ss"
    git add commit.md -f
    git commit --date="$Y-$M-$D $tt:$mm:$ss" -m "update and deploy firebase function for code.angularjs.org on $M/$D/$Y"
done
git push origin master --force
git rm -rf 20**
git commit -am "cleanup"
git push origin master --force
