echo "*******************************************************"
echo "*********           SCRIPT RTKBASE            *********"
echo "*******************************************************"
mkdir -p /home/pi 
cd /home/pi
echo " "
echo " "
echo " "
echo "*******************************************************"
echo "**********        DOWNLOADING RTKtouch         **********"
echo "**********  (This may take several minutes)  **********"
echo "*******************************************************"
git clone git://github.com/Francklin2/RTKLIB_Touchscreen_GUI.git ./rtktouch
echo "*******************************************************"
echo "************       RTKtouch DOWNLOADED       ************"
echo "*******************************************************"
echo " "
echo " "
echo " "
echo "*******************************************************"
echo "********          COMPILING SOFTWARE          *********"
echo "*******************************************************"
mv rtktouch/RTKBASE ./
rm -rf rtktouch
cd RTKBASE
## dest base path
LOG_PATH="$PWD/logs"
## get sys vars
ARCH=`uname -m`
CORES=`grep -c processor /proc/cpuinfo`
## prevents different (localized) output
LC_ALL=C
## removing old stuff
rm -Rf "$LOG_PATH"
## create needed directory
mkdir -p "$LOG_PATH"
## output sys info
echo "System info:" > "$LOG_PATH/sysinfo.txt"
uname -a > "$LOG_PATH/sysinfo.txt"
echo
echo "  > building required static lib rtklib"
cd ./lib/rtklib
chmod +x make_library.sh > "$LOG_PATH/rtklib_rights.log" 2>&1
./make_library.sh > "$LOG_PATH/rtklib.log" 2>&1
echo "  < done - `date`"
echo
echo "  > building RTKBASE"
cd ../../
make clean > "$LOG_PATH/RTKBASE_clean.log" 2>&1
qmake-qt4 > "$LOG_PATH/RTKBASE_qmake.log" 2>&1
make -j$CORES > "$LOG_PATH/RTKBASE.log" 2>&1
echo "  < done - `date`"
echo "  - script finished - `date`"
echo "*******************************************************"
echo "************       SOFTWARE COMPILED       ************"
echo "*******************************************************"
echo "*******************************************************"

