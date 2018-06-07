#!/usr/bin/env node

var config = require('./scripts/config.json')
var execSync = require('child_process').execSync

runIf(config.apc, 'sh scripts/apc.sh')
runIf(config.zpool, 'sh scripts/zpool.sh')
runIf(config.diskspace.use, 'node scripts/diskspace.js')
runIf(config.hddtemp.use, 'node scripts/hddtemp.js')
runIf(config.service.use, 'sh scripts/services.sh')
runIf(config.ssl.use, 'node scripts/ssl.js')

function runIf (condition, script) {
  if (condition) {
    try {
      console.log(execSync(script).toString())
    } 
    catch (error) {
      console.error(error.status)
      console.error(error.message)
      console.error(error.stderr.toString())
      console.error(error.stdout.toString())
    }
  }
}
