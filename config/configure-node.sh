
node_name=$1


echo "create symbolic links for $node_name in `pwd`"


# check if target exits
target=$CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/config/nodes/$node_name

if ! test -d $target; 
then
 echo "target node $target does not exist"
 exit 1 
fi

if test -f "node"; then
 unlink "node"
fi

ln -s $target node

contexts="yarp/contexts"
if test -f $contexts; then 
  unlink $contexts
fi 

ln -s $CARLSIMPP_SUPERBUILD_INSTALL_PREFIX/config/nodes/$node_name/contexts $contexts


 
