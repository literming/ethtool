
DEPLOY_PATH=/root
ETHTOOL_PATH=$DEPLOY_PATH/ethtool
LMNL_INSTALL_PATH=$DEPLOY_PATH/libmnl-1.0.5/install_path
'''
cd $DEPLOY_PATH
wget --no-check-certificate  https://www.netfilter.org/pub/libmnl/libmnl-1.0.5.tar.bz2
tar -jxvf libmnl-1.0.5.tar.bz2 libmnl-1.0.5/
cd libmnl-1.0.5/
mkdir install_path
./configure --prefix=$LMNL_INSTALL_PATH LDFLAGS=-static
make && make install
'''
cd $ETHTOOL_PATH
#./configure MNL_CFLAGS="-I $LMNL_INSTALL_PATH/include" MNL_LIBS="-L $LMNL_INSTALL_PATH/lib -lmnl" LDFLAGS=-static
./configure LDFLAGS=-static
if [ -f ethtool ]; then
	mv ethtool ethtool_bak 
fi
make


