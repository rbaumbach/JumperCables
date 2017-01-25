# Jumper Cables
A set of scripts that give a fresh install of OS X a jump

**Note: Currently these are a set of scripts that I personally use to set up a bare bones machine.**

## Requirements

- Scripts currently only support [El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117) and [Sierra](https://itunes.apple.com/us/app/macos-sierra/id1127487414?mt=12)
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835)

## Using Jumper Cables

Clone the Jumper Cables repository and navigate to the root directory:

```sh
$ git clone git@github.com:rbaumbach/JumperCables.git
$ cd JumperCables
```

Update [configz/config.sh](https://github.com/rbaumbach/JumperCables/blob/master/configz/config.sh) configuration script with your information.  This file contains environmental variables that are used throughout the script that will be used when generating your SSH/GPG keys, git configurations and .bash_profile environmental variables.

Once your configuration is complete, open up the OS X Terminal and run the following command in the Jumper Cables project root directory:

```sh
$ ./GiveMeAJump.sh
```

## Future Goals

- Allow individual running of install scripts (currently Jumper Cables must be ran as a whole).
- Make scripts less destructive so that if they are run on a machine that isn't bare bones they don't overwrite existing configurations.
- Add logging output of the entire installation.

## For your personal usage

If you'd like to customize this project for a project's use:

- Fork the project
- Edit the scripts to your liking

## Notes on security

The purpose of these scripts are to create a 100% unattended installation of all my settings, apps, etc. on my personal machines.  This makes is simple wipe my machines at will (such as performing clean 100% installations of macOS with each version instead of an upgrade) while keeping development configuration setup at a minimal.  This repo was not meant to be stored on a public machine or it's contents left for prying eyes as it could contain sensitive information.

### Config.sh file

This file contains sensitive information such as Github tokens and SSH/GPG key passphrases.  After a successful jump this file should be deleted if it can be viewed by anybody who has access to the machine.

### Password

These scripts are able to "cache" your password in order that all scripts can be run unattended.  This is done by [generating a throw away SSH key and saving your password to file and encrypting it using ssl](https://github.com/rbaumbach/JumperCables/blob/master/installz/setup.sh), and then decrypting it whenever it's needed.  [At the end of the scripts](https://github.com/rbaumbach/JumperCables/blob/master/installz/the-end.sh) this encrypted file along with the throw away SSH key are deleted.

## Acknowledgements

The name Jumper Cables was created by none other than [Mr. WDW](https://github.com/weitzel926) himself (Along with another great name, "Skid Greaser").

These scripts were inspired by [Pivotal Workstation Setup](https://github.com/pivotal/workstation-setup).
