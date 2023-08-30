// CONECTANDO AO BD
var mysql = require('mysql')
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: 'join_us'
});

connection.connect(function(err){
    if (err){
        console.log('Erro ao conectar-se: ' + err.stack);
        return;
    }
    console.log('Conexão bem sucedida. ID: ' + connection.threadId);
});

const { faker } = require('@faker-js/faker')

var data = [];
for (i = 0; i < 5; i++){
    data.push([
        faker.internet.email(),
        faker.date.past({years: 10})
    ])
}

var ins = 'INSERT INTO users VALUES ?'
connection.query(ins, [data], function(err, res){
    console.log(err);
    console.log(res);
});


var c = 'select * from users'
connection.query(c, function(err, res){
    console.log(err);
    console.log(res);
});

connection.end();