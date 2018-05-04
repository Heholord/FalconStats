#!/usr/bin/env node

# @author   https://www.reddit.com/user/LookAtMyKeyboard
# @rewrite  https://www.reddit.com/user/cloudrac3r

var util = require("util");
var exec = require("child_process").exec;
var child;
var style = require("ansi-styles");

var disk = ["a", "c", "d", "e", "g", "h", "i", "j"].map(i => "/dev/sd"+i);
const columns = 4;

child = exec("hddtemp "+disk.join(" "), (error, stdout, stderr) => {
    if (error) return;
    const styles = [
        {
            range: temp => temp < 30,
            color: "bgCyan"
        },{
            range: temp => temp < 38,
            color: "bgGreen"
        },{
            range: temp => temp < 40,
            color: "bgYellow"
        },{
            range: temp => true,
            color: "bgRed"
        }
    ];

    let output = "Hard disk temperature:\n"+style.color.black.open;

    stdout.split("\n").slice(0, -1).forEach((line, i, temps) => {
        let match = line.match(new RegExp("^(/dev/[a-z]{3}): .*?: ([0-9]{2})"));
        let [name, temp] = match.slice(1);

        let styleName = styles.find(s => s.range(temp)).color;
        let tempStyle = style.bgColor[styleName].open;

        if (i % columns == 0 && i != 0) output += "\n\n";
        output += "  "+tempStyle+" "+name.replace("/dev/", "")+" "+temp+"°C "+style.bgColor.close;
    });
    console.log(output);
});
