# FalconStats

Custom motd scripts can be loaded into the ```/etc/motd``` file.

[Original reddit post](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/)
on [/r/unixporn](https://www.reddit.com/r/unixporn) by
[/u/LookAtMyKeyboard](https://www.reddit.com/user/LookAtMyKeyboard)

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

## Run scripts

```sh
node [script].js
```

## Future wishes and pull request offers

If you send me a pull request I offer you to name your github repo next to the feature you have implemented

- [ ] adaptable config for all scripts
- [ ] implement service.js for many services
- [ ] write a startup scripts which includes the other scripts
- [ ] implement [reddit openssl comment](https://www.reddit.com/r/unixporn/comments/8gwcti/motd_ubuntu_server_1804_lts_my_motd_scripts_for/dyfbi0k/)
- [ ] make a logo for this project
- [ ] feel free to add features