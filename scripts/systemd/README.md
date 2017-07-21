# Disable ubuntus error popups
systemctl disable apport.service
systemctl mask apport.service
# Copy things to systemd directory.
cp /home/tv/scripts/systemd/tv*.service /etc/systemd/system
cp /home/tv/scripts/systemd/custom.target /etc/systemd/system
#Install nvidia drivers...
#Enable the tv services
systemctl enable tv1
systemctl enable tv2
systemctl enable tv3