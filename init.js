const chalk       = require('chalk');
const clear       = require('clear');
const figlet      = require('figlet');
const inquirer    = require('inquirer');
const configFile  = './scripts/config.json';
const fs          = require('fs');

clear();
console.log(
  chalk.yellow(
    figlet.textSync('FALCON config', { horizontalLayout: 'half' })
  )
);

if (fs.existsSync(configFile)) {
  const question = {
      name: 'overwrite',
      type: 'confirm',
      message: 'You already have a config. Do you want to overwrite it?',
      default: false,
  };
  overwrite = inquirer.prompt(question).then(answers => {
    if(answers.overwrite){
      initConfig();
    }
  });
} else {
  initConfig();
}

initConfig = function() {
  const questions = [
    {
      name: 'apc',
      type: 'confirm',
      message: 'Do you want to display apc properties?',
      default: true,
    },
    {
      name: 'zpool',
      type: 'confirm',
      message: 'And also the ZPOOL status?',
      default: true,
    },
    {
      name: 'diskspace',
      type: 'confirm',
      message: 'Do you want to display diskspaces settings?',
      default: true,
    },
    {
      name: 'mountpoints',
      type: 'input',
      message: 'What are the mountpoints? Please seperate with \",\":',
      when: function(answer) {
        return answer.diskspace;
      },
      filter: function(answer){return filterLists(answer);},
    },
    {
      name: 'hddtemp',
      type: 'confirm',
      message: 'Would you like to see your hard drive temperature?',
      default: true,
    },
    {
      name: 'drives',
      type: 'input',
      message: 'Where are these drives (usually it starts with \"/dev/<drive>\")? Please enter the full path and seperate with \",\":',
      when: function(answer) {
        return answer.hddtemp;
      },
      filter: function(answer){return filterLists(answer);},
    },
    {
      name: 'service',
      type: 'confirm',
      message: 'And should we show you services?',
      default: true,
    },
    {
      name: 'services',
      type: 'input',
      message: 'What services do you want to see? Please seperate with \",\":',
      when: function(answer) {
        return answer.service;
      },
      filter: function(answer){return filterLists(answer);},
    },
    {
      name: 'ssl',
      type: 'confirm',
      message: 'Last but not least, do you wish to see your ssl certificate expiration dates?',
      default: true,
    },
    {
      name: 'domains',
      type: 'input',
      message: 'What domains are those? Please seperate with \",\":',
      when: function(answer) {
        return answer.ssl;
      },
      filter: function(answer){return filterLists(answer);},
    },
  ];
  inquirer.prompt(questions).then(answers => {
    if(answers.mountpoints){
      answers.diskspace = {use: answers.diskspace};
      answers.diskspace.mountpoints = answers.mountpoints;
      delete answers.mountpoints;
    }
    if(answers.drives){
      answers.hddtemp = {use: answers.hddtemp};
      answers.hddtemp.drives = Object.assign({}, answers.drives);
      delete answers.drives;
    }
    if(answers.services){
      answers.service = {use: answers.service};
      answers.service.services = Object.assign({}, answers.services);
      delete answers.services;
    }
    if(answers.domains){
      answers.ssl = {use: answers.ssl};
      answers.ssl["domains"] = Object.assign({}, answers.domains);
      delete answers["domains"];
    }
    console.log(answers);
    var fs = require('fs');
      fs.writeFile(configFile, JSON.stringify(answers, null, 2), function(err) {
        if(err) {
          return console.log(chalk.red(err));
        }
        console.log(chalk.yellow("The config was saved! You can always view your config in \"scritps/config.json\""));
    });
  });
}

filterLists = function(answer){
  answer = answer.replace(/ /g,"");
  return answer.split(",");
}

function clone(obj) {
    if (null == obj || "object" != typeof obj) return obj;
    var copy = obj.constructor();
    for (var attr in obj) {
        if (obj.hasOwnProperty(attr)) copy[attr] = obj[attr];
    }
    return copy;
}
