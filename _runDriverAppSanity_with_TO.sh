#!/usr/bin/env bash

echo "// --- --- --- --- --- --- --- ---"
echo "** KILLING EXISTING EMULATORS **"
sh _emulator-kill-all.sh &
sleep 5s
echo "** DONE KILLING EMULATORS **"
echo "--- --- --- --- --- --- --- --- //"

echo "// --- --- --- --- --- --- --- ---"
echo "** FETCHING LATEST CA **"
cd $DA
git fetch
sleep 15s
git checkout espresso-refector-onboarding
sleep 2s
echo "** FETCHING LATEST CA DONE **"
echo "--- --- --- --- --- --- --- --- //"

echo "// --- --- --- --- --- --- --- ---"
echo "** RE-LAUNCHING EMULATORS **"
echo "Launching emulator Carl_Sagan"
./_emulator-launch.sh Carl_Sagan &
sleep 30s
#echo "Launching emulator Sam_Harris"
#./_emulator-launch.sh Sam_Harris &
#sleep 15s
echo "** DONE LAUNCHING EMULATORS **"
echo "--- --- --- --- --- --- --- --- //"

echo "// --- --- --- --- --- --- --- ---"
echo "** FETCHING LATEST TO **"
cd $TO
git fetch
sleep 15s
git checkout ca_config
sleep 2s
echo "** FETCHING LATEST TO DONE **"
echo "--- --- --- --- --- --- --- --- //"

echo "// --- --- --- --- --- --- --- ---"
echo "** FETCHING LATEST UTILS **"
cd $UTILS
git fetch
sleep 10s
echo "** FETCHING LATEST UTILS DONE **"

echo "// --- --- --- --- --- --- --- ---"
echo "** RESTARTING ADB SERVER **"
adb kill-server
sleep 2s
adb start-server
sleep 2s
echo "** ADB SERVER RESTART DONE **"
echo "--- --- --- --- --- --- --- --- //"

echo "// --- --- --- --- --- --- --- ---"
echo "** LAUNCHING TO Launcher.py **"
cd $TO
python3 ./Launcher.py -tset AllSanity -lplan reBuild
echo "** TO Launcher.py DONE **"
echo "--- --- --- --- --- --- --- --- //"
