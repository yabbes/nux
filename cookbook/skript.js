var fs = require('fs'),
    readline = require('readline');
var locallydb = require('locallydb');
var db = new locallydb('./mydb2');
var collection = db.collection('logfile');


var rd = readline.createInterface({
    input: fs.createReadStream('logs.txt'),
    output: false,
    console: false
});
var i=0;
rd.on('line', function(line) {
    //var filtered = new RegExp('<.(\w*)>\s(.*)', 'g');
    var first = line.match(/<.(\w*)>/);

    var second = line.match(/\w*>\s(.*)/);
    if (first && second && second[1].length > 80) {
        collection.insert([
            {name: first[1], message: second[1]}
        ]);
        collection.save();
        console.log("saved: " + first[1] + ": " + second[1]);
        
        i++
    }
    if (i % 9000 == 0 && second) {
        console.log('found more than ' + i + "lines to db");
        //console.log(second.length);
    }
    //i++;
    /*
    collection.insert([
        {name: first[1], message: second[1]}
    ]);
    collection.save();
    */
    /*
    if (i==90) {
        console.log(first[1] + ': ' + second[1]);
        
    }

    */
});


console.log('found ' + i + "long sentences");
