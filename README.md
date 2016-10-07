# Jumper Cables
A set of scripts that give a fresh install of OS X a jump

**Note: Currently these are a set of scripts that I personally use to set up a bare bones machine.**

## Requirements

- Scripts currently only support [El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117) and [Sierra](https://itunes.apple.com/us/app/macos-sierra/id1127487414?mt=12)
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835)

## Using Jumper Cables

Open up the OS X Terminal and run the following commands:

```sh
$ git clone git@github.com:rbaumbach/JumperCables.git
$ cd JumperCables
$ ./GiveMeAJump.sh
```

## Future Goals

- Make it 100% automated! Currently the scripts require usernames, passwords and login credentials throughout the execution.
- To strip out all "hardcoded" values and create a config file to make these scripts more generic.
- Make scripts less destructive so that if they are run on a machine that isn't bare bones they don't overwrite existing configurations.
- Add ability to provide .ssh and .gnupg directories before running scripts and not generate new default ones.

## For your personal usage

If you'd like to customize this project for a project's use:

- Fork the project
- Edit the scripts to your liking

## Acknowledgements

The name Jumper Cables was created by none other than [Mr. WDW](https://github.com/weitzel926) himself (Along with another great name, "Skid Greaser").

These scripts were inspired by [Pivotal Workstation Setup](https://github.com/pivotal/workstation-setup).
