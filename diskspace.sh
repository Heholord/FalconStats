#!/usr/bin/env node

# @author   https://www.reddit.com/user/LookAtMyKeyboard
# @rewrite  https://www.reddit.com/user/cloudrac3r

const util = require("util");
const exec = require("child_process").exec;
const style = require("ansi-styles");

const padding = "  ";
const barWidth = 44;
const disks = [
    {
        mountpoint: "/",
        nicemountpoint: "/",
    },{
        mountpoint: "/mnt/bulk",
        nicemountpoint: "/mnt/bulk",
    },{
        mountpoint: "/home",
        nicemountpoint: "~",
    }
];
const colors = [
    {
        range: per => per < 80,
        color: "green"
    },{
        range: per => per < 90,
        color: "yellow"
    },{
        range: per => true,
        color: "red"
    }
];

exec("df -h "+disks.map(d => d.mountpoint).join(" "), (error, stdout, stderr) => {
    if (error) throw error;
    let lines = stdout.split("\n").filter(l => l);

    let output = [lines.shift().replace("Filesystem ", "Filesystems")];

    lines.forEach((line,i) => {
        let disk = disks[i];

        output.push(line.replace(disk.mountpoint, disk.nicemountpoint));

        let percent = +line.match(/(\d+)%/)[1];
        let bar = "["+Array(barWidth).fill().map((_,n) => {
            n = n/barWidth*100;
            if (percent >= n) return style.color[colors.find(c => c.range(n)).color].open+"="+style.color.close;
            else return style.color.gray.open+"="+style.color.close;
        }).join("")+"]";

        output.push(bar);
    });
    console.log(output.join("\n"));
});
