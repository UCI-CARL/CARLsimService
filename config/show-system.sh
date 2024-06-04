echo "superbuild: $CARLSIMPP_SUPERBUILD_INSTALL_PREFIX"

echo "path entries:"
echo $PATH | tr ':' '\n' | grep carl
echo $PATH | tr ':' '\n' | grep yarp

echo "environment variables:"
env | grep -i carlsim
env | grep -i yarp

