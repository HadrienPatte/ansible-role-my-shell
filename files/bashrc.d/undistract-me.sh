UNDISTRACT=/etc/profile.d/undistract-me.sh
if [ -f $UNDISTRACT ]; then
    . $UNDISTRACT
fi
unset UNDISTRACT
