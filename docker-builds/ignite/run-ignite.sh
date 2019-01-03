#!/usr/bin/with-contenv bash

# find initial nodes
if [ -z ${SEED_HOSTS} ]; then
  echo no seed hosts provided, using localhost...
  sed -i "s/%seed_hosts%/<value>127.0.0.1<\/value>/" $IGNITE_HOME/config/default-config.xml
else
  echo set seed hosts to ${SEED_HOSTS}
  sed -i "s/%seed_hosts%/${SEED_HOSTS}/" $IGNITE_HOME/config/default-config.xml
fi

if [ ! -z "$OPTION_LIBS" ]; then
  IFS=, LIBS_LIST=("$OPTION_LIBS")
  for lib in ${LIBS_LIST[@]}; do
    cp -r $IGNITE_HOME/libs/optional/"$lib"/* \
        $IGNITE_HOME/libs/
  done
fi

if [ ! -z "$EXTERNAL_LIBS" ]; then
  IFS=, LIBS_LIST=("$EXTERNAL_LIBS")
  for lib in ${LIBS_LIST[@]}; do
    echo $lib >> temp
  done
  wget -i temp -P $IGNITE_HOME/libs
  rm temp
fi

QUIET=""

if [ "$IGNITE_QUIET" = "false" ]; then
  QUIET="-v"
fi

if [ -z $CONFIG_URI ]; then
  exec  $IGNITE_HOME/bin/ignite.sh $QUIET 
#exec  $IGNITE_HOME/bin/ignite.sh $QUITE $IGNITE_HOME/config/server/ecube-data-grid.xml
else
  $IGNITE_HOME/bin/ignite.sh $QUIET $CONFIG_URI
fi
