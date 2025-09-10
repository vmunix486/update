# update
An simple shell script meant to automatically run the update command on as many distributions as possible.

# What does it do?

It looks in /etc/os-release and sees what distribution you are running, it then runs the commands needed to update the distribution. If the distribution does not have a /etc/os-release (eg. NetBSD), it'll use uname -s to find your distribution. If you want to reboot after updating, add -r or --reboot.

# Why?

As a easy first project. It might be a little helpful if your distribution has a lot of commands needed to update (eg. Gentoo). It's my first time using github, so if I'm doing something wrong, please tell me.

# How do I add a new distribution?

Make an issuse with the following critera:
 - Name of distribution
 - If it is based on another distribution (eg. Devuan -> Debian)
 - Contents of /etc/os-release or uname -s and uname -a output.
 - Package manager, and the required options to update and upgrade the packages 

# Requirements?

 - POSIX-compatible shell
 - A supported distribution

# What distributions are supported?

At the moment, only the following distributions are supported:

- Debian
- Devuan
- Ubuntu
- Gentoo
- Arch
- Alpine
- Fedora
- RHEL
- Slackware
- Adelie
- FreeBSD
- T2 SDE
- NetBSD

# TODO?

 - Add more support.
 - Add BSD support (FreeBSD: 9/8/25, NetBSD: 9/10/25)
 - Add Install Script (Finished 9/9/25)
