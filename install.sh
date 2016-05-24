# /bin/sh
# vera++ lint configurator install script

rc=~/.bashrc
VERA_ROOT=/usr/lib/vera++/

if [ ! -f "$rc" ]
then
    touch $rc
fi

exists=`grep "alias vera++" $rc | wc -l`

if [ $exists -ne 1 ]
then
    echo "alias vera++='vera++ -p cv_lint -P max-line-length=80 -P strict-trailing-space=1'" >> $rc
fi

sudo cp cv_lint $VERA_ROOT/profiles/
sudo cp CV001.tcl $VERA_ROOT/scripts/rules/
