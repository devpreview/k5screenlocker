# k5screenlocker
Detect full screen application and disabled KDE5 screen locker.

# Installation
1. sudo apt-get install grep sed bc xdotool qdbus libnotify-bin
2. sudo wget -P /usr/local/bin https://raw.githubusercontent.com/devpreview/k5screenlocker/master/k5screenlocker.sh
3. sudo chmod 0755 /usr/local/bin/k5screenlocker.sh
4. Add script to autostart so they automatically start during the startup of your KDE session (kcmshell5 autostart)
5. Restart KDE or system.
