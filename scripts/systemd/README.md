# Disable ubuntus error popups
systemctl disable apport.service

systemctl mask apport.service

# Copy things to systemd directory.
cp /home/tv/scripts/systemd/tv*.service /etc/systemd/system

cp /home/tv/scripts/systemd/custom.target /etc/systemd/system

# Install nvidia drivers...
# Enable the tv services
systemctl enable tv1

systemctl enable tv2

systemctl enable tv3

# custom.target
Is a custom target that should make sure that anything that targets it gets executed when the system has finished loading. (Webbrowsers ended up with weird resolutions otherwise).
