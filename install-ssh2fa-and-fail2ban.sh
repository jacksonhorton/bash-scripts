#!/bin/bash
# Adds 2FA with OPENSSH using Google Authenticator
# https://ubuntu.com/tutorials/configure-ssh-2fa#2-installing-and-configuring-required-packages



## 2. Installing and configuring required packages
sudo apt install libpam-google-authenticator

# add the following line to "/etc/pam.d/sshd"
# auth required pam_google_authenticator.so
sudo nano /etc/pam.d/sshd

# Restart sshd daemon
sudo systemctl restart sshd.service

# Modify /etc/ssh/sshd_config
# change ChallengeResponseAuthentication from "no", to "yes".
sudo nano /etc/ssh/sshd_config



## 3. Configuring authentication
# Google Authenticator makes the configuration of two-factor authentication much easier, comparing to (for example) libpam-oath.
#
# In a terminal, run the google-authenticator command.
#
# It will ask you a series of questions, here is a recommended configuration:
#
# Make tokens “time-base””: yes
# Update the .google_authenticator file: yes
# Disallow multiple uses: yes
# Increase the original generation time limit: no
# Enable rate-limiting: yes
# You may have noticed the giant QR code that appeared during the process, underneath are your emergency scratch codes to be used if you don’t have access to your phone: write them down on paper and keep them in a safe place.
#
# That’s all. Now, let’s open Google Authenticator and add our secret key to make it work.




## Installs fail2ban
# https://www.redhat.com/sysadmin/protect-systems-fail2ban
sudo apt -y install fail2ban

sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Copy the /etc/fail2ban/jail.conf file to /etc/fail2ban/jail.local. The jail.local file is the configuration file of interest for us.
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
# Open /etc/fail2ban/jail.local in your favorite editor and make the following changes or check to be sure these few parameters are set. Look for the setting ignoreip and add all IP addresses to this line that must have access without the possibility of a lockout. By default, you should add the loopback address, and all IP addresses local to the protected system.
sudo nano /etc/fail2ban/jail.local

# restart fail2ban
sudo systemctl restart fail2ban

# create a filtered service
# To set up filtered services, you must create a corresponding "jail" file under the /etc/fail2ban/jail.d directory. For SSHD, create a new file named sshd.local and enter service filtering instructions into it.
sudo nano /etc/fail2ban/jail.d/sshd.local


# to check logs:
# $ tail the /var/log/fail2ban.log

# unban a system
# It will inevitably happen that a system gets banned that needs to be quickly unbanned. In other words, you can't or don't want to wait for the ban period to expire. The following command will immediately unban a system.
## $ sudo fail2ban-client set sshd unbanip 192.168.1.69
# You don't need to restart the fail2ban daemon after issuing this command.

