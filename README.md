![FalconStats](/img/falconStats.png?raw=true)

# FalconStats

[Original reddit post](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/) on [/r/unixporn](https://www.reddit.com/r/unixporn) by [@hermannbjorgvin](https://github.com/hermannbjorgvin/)

![Notification](https://i.imgur.com/XMSekjG.png)

## Requires

- Linux
- nodejs and nodejs package manager (npm)

## Install

1. Clone into some Folder

  ```sh
  git clone https://github.com/Heholord/FalconStats
  ```

2. Enter Folder

```sh
cd FalconStats
```

1. Install Globally to get the Binaries avaiable

```sh
npm install -g
```

1. SymLink into the `/etc/update-motd` folder in Ubuntu ([see](https://wiki.ubuntu.com/UpdateMotd)).

```sh
ln -s falcon-motd /etc/update-motd.d/falconstats
```

1. Run the Auto-Configuration

![Interactive Configuration](https://i.imgur.com/3yulvHB.png)

For interactive configuration run

```bash
node init.js
```

You can always view or edit your config in [scripts/config.json](scripts/config.json)

## Testrun your motd

```sh
falcon-motd
```

## Run scripts

You can run all scripts configured in the scripts/config.json using

```bash
node start.js
```

If you want to run them individually, have a look here:

For nodejs files (*.js):

```bash
node scripts/[script].js
```

For shell scripts files (*.sh):

```bash
bash scripts/[script].sh
# or
sh scripts/[script].sh
# or
cd scripts
./[script].sh
```

Note: `hddtemp` may require root privileges. It defaults to using `sudo`. Adding
`hddtemp` to your user as a NOPASSWD command is one way to make it work.

## Future wishes and pull request offers

If you send me a pull request I offer you to name your github repo next to the feature you have implemented

- [x] adaptable config for all scripts
- [ ] implement service.js for many services
- [x] write a startup scripts which includes the other scripts - thanks to [DSigmund](https://github.com/DSigmund)
- [x] [interactive program would be helpful for user configuration](https://github.com/Heholord/FalconStats/commit/ba290d6414ca126abee7c5efa8af6c4103c3104b)
- [ ] implement [reddit openssl comment](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/dyfbi0k/)
- [x] make a logo for this project - by [J-tt](https://github.com/J-tt)
- [ ] feel free to add features

# We are better together

- First pull request by [TechnologyClassroom](https://github.com/TechnologyClassroom)
- thank you [stevesbrain](https://github.com/stevesbrain) for checking our dependency list. This can be a pain in the a** sometimes
- Thank you [MrPowerMac](https://github.com/MrPowerMac) for suggesting this project a licence. Now we are truly open source.
- [J-tt](https://github.com/J-tt) added a logo to our project 🎉
- Thank you [DSigmund](https://github.com/DSigmund) for your startup script. It is very helpful!
