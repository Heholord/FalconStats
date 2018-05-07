![FalconScript](/img/FalconStats.png?raw=true)
## FalconStats

[Original reddit post](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/) on [/r/unixporn](https://www.reddit.com/r/unixporn) by [@hermannbjorgvin](https://github.com/hermannbjorgvin/)

![Notification](https://i.imgur.com/XMSekjG.png)

## Requires

- Linux
- nodejs and nodejs package manager (npm)

## Install

```sh
npm install
```

or if you like a global installation

```sh
npm install -g
```

Custom motd scripts can be placed into the `/etc/update-motd` folder.

## Auto-configuration

![Interactive Configuration](https://i.imgur.com/3yulvHB.png)

For interactive configuration run

```bash
node init.js
```

You can always few your config in [scripts/config.json](config.json)

## Run scripts

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

## Future wishes and pull request offers

If you send me a pull request I offer you to name your github repo next to the feature you have implemented

- [ ] adaptable config for all scripts
- [ ] implement service.js for many services
- [ ] write a startup scripts which includes the other scripts
- [x] [interactive program would be helpful for user configuration](https://github.com/Heholord/FalconStats/commit/ba290d6414ca126abee7c5efa8af6c4103c3104b)
- [ ] implement [reddit openssl comment](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/dyfbi0k/)
- [ ] make a logo for this project
- [ ] feel free to add features

# We are better together

- First pull request by [TechnologyClassroom](https://github.com/TechnologyClassroom)
- thank you [stevesbrain](https://github.com/stevesbrain) for checking our dependency list. This can be a pain in the a** sometimes
- Thank you [MrPowerMac](https://github.com/MrPowerMac) for suggesting this project a licence. Now we are truly open source.
