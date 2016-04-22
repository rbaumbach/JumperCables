# JumperCables
A set of scripts that give a fresh install of OS X a jump

**Note: Currently these are a set of scripts that I personally use to set up a bare bones machine.**

## Requirements

- Scripts currently only support [El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117)
- Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835)

## Using Jumper Cables

Open up the OS X Terminal and run the following commands:

```sh
$ git clone git@github.com:rbaumbach/JumperCables.git
$ cd JumperCables
$ ./GiveMeAJump.sh
```

If you have saved .ssh and .gnupg directories you would like to be copied on a new machine, copy these to the root directory of Jumper Cables.  The scripts will find these use them.  See [gpg.sh](https://github.com/rbaumbach/JumperCables/blob/master/ElCapitan/gpg.sh) or [ssh.sh](https://github.com/rbaumbach/JumperCables/blob/master/ElCapitan/ssh.sh) for more details.



## Future Goals

- Make it 100% automated! Currently the scripts require usernames, passwords and login credentials throughout the execution.
- To strip out all "hardcoded" values and create a config file to make these scripts more generic.
- Make scripts less destructive so that if they are run on a machine that isn't bare bones they don't overwrite existing configurations.

## For your personal usage

If you'd like to customize this project for a project's use:

- Fork the project
- Edit the scripts to your liking

## Acknowledgements

The name Jumper Cables was created by none other than [Mr. WDW](https://github.com/weitzel926) himself (Along with another great name, "Skid Greaser").

These scripts were inspired by [Pivotal Workstation Setup](https://github.com/pivotal/workstation-setup).
