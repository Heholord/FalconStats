#!/usr/bin/env node

# @author   https://www.reddit.com/user/LookAtMyKeyboard

var style = require("ansi-styles");
var sslCertificate = require('get-ssl-certificate');

var redTriangle = style.color.red.open + "▲" + style.color.close;
var greenCircle = style.color.green.open + "●" + style.color.close;

var domains = [
    "domain.com",
    "example.com"
];

console.log("\nSSL Certificates:");
domains.forEach(function(domain){
    sslCertificate.get(domain).then(function (certificate) {
        // console.log(certificate.valid_from)
        // 'Nov  8 00:00:00 2015 GMT'

        var expiryDate = new Date(certificate.valid_to);
        var indent = "\t";
        if (domain.length <=10){ indent = "\t\t";};

        console.log("  " + greenCircle + " " + domain + indent + "valid until " + expiryDate.toDateString());
        // 'Aug 22 23:59:59 2017 GMT'
    }).catch(function(err) {
        console.log("  " + redTriangle + " " + domain + " " + err.message);
    });
});
