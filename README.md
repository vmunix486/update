# update
An simple bash script meant to automatically run the update command on as many distributions as possible.

# What does it do?

It looks in /etc/os-release and sees what distrobution you are running, it then runs the commands needed to update the distribution.

# Why?

As a easy first project. It might be a little helpful if your distro has a lot of commands needed to update (eg. Gentoo). If your distribution is not in the list of the script you can add it in.

# How do I add a new distribution?

Easy. You just add an issue stating what distribution you want to add, and what commands update the system.

# Requirements?

 - Bash 3.0+
 - A supported distribution

# What distributions are supported?

At the moment, only the following distros are supported:

- Debian
- Devuan
- Ubuntu
- Gentoo
- Arch
- Alpine
- Fedora
- RHEL
- Slackware

# TODO?

 - Add more support.
 - Add BSD support
 - Add Install Script
