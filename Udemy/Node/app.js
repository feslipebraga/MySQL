// IMPORTANDO O PACOTE "FAKER"
const {faker} = require('@faker-js/faker');

// CONECTANDO AO BD
var mysql = require('mysql');
var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root123",
    database: "join_us",
    connectionLimit: 10
});

// INSERINDO DADOS ALEATORIOS NA TABELA
/* for (x = 0; x < 10; x++){
    var person = {
        email: faker.internet.email(),
        createdAt: faker.date.past()    
    }
    connection.query('INSERT INTO users SET ?', person, function(err, results){
        if(err) throw error;
    });
} */

// OU
var data = []
for (var i = 0; i < 10; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ])
};

connection.query('INSERT INTO users VALUES ?', [data], function(err, results){
    console.log(err);
    console.log(results);
});

// MOSTRE TODOS OS DADOS DA TABELA USERS
var q = 'SELECT email FROM users';
connection.query(q, function (err, results, fields) {
  if (err) throw error;
  // percorre os resultados e imprime somente o email
  results.forEach(function(res) {
    console.log(res.email);
  });
});

// CONTE E MOSTRE O NUMERO DE LINHAS NA TABELA
var w = 'SELECT COUNT(*) as total FROM users';
connection.query(w, function(err, results, fields) {
    if (err) throw error;
    console.log(`Ao total, foram inseridos ${results[0].total} emails.`)
});

connection.end();