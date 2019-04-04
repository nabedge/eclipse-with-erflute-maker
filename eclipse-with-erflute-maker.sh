#!/bin/sh
TARGET=./target
ERFLUTE_JAR="org.dbflute.erflute_0.5.7.jar"
ERFLUTE="http://dbflute.seasar.org/download/misc/helper/erflute/$ERFLUTE_JAR"
ECLIPSE_DMG="http://ftp.jaist.ac.jp/pub/eclipse/technology/epp/downloads/release/2019-03/R/eclipse-committers-2019-03-R-macosx-cocoa-x86_64.dmg"

# clear
rm -fr $TARGET
mkdir $TARGET

# download and copy
curl -o $TARGET/$ERFLUTE_JAR $ERFLUTE
curl -o $TARGET/eclipse.dmg $ECLIPSE_DMG

hdiutil mount target/eclipse.dmg
cp -R /Volumes/Eclipse/Eclipse.app $TARGET
hdiutil detach /Volumes/Eclipse

DROPINS_DIR=$TARGET/Eclipse.app/Contents/Eclipse/dropins/ERFlute/eclipse/plugins/
mkdir -p $DROPINS_DIR
cp $TARGET/$ERFLUTE_JAR $DROPINS_DIR

ECLIPSE_HOME=$TARGET/Eclipse.app

# eclipse.iniのメモリサイズ調整
ECLIPSE_INI=$ECLIPSE_HOME/Contents/Eclipse/eclipse.ini
cp $ECLIPSE_INI $TMPDIR/_eclipse.ini
cat $TMPDIR/_eclipse.ini \
  | sed -e 's/-Xms256m/-Xms1g/g' \
  | sed -e 's/-Xmx1024m/-Xmx3g/g' \
  > $ECLIPSE_INI

## install Eclipse 2.0 style plugin support
#CMD_BASE="$ECLIPSE_HOME/Contents/MacOS/eclipse -nosplash -application org.eclipse.equinox.p2.director"
#CMD_BASE="$CMD_BASE -clean"
#CMD_BASE="$CMD_BASE -debug"
#CMD_BASE="$CMD_BASE -repository http://download.eclipse.org/releases/oxygen"
#CMD_BASE="$CMD_BASE -repository http://download.eclipse.org/eclipse/updates/4.7"
#
#CMD="$CMD_BASE -installIU org.eclipse.osgi.compatibility.plugins.feature.feature.group"
#$CMD
