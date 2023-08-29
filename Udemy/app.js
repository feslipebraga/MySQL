var mysql = require('mysql');

var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root123",
    database: "join_us",
    connectionLimit: 10
})


var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
connection.query(q, function(err, result, fields) {
    if (err) throw error;
    console.log(result[0].time);
    console.log(result[0].date);
    console.log(result[0].now);
});

connection.end();