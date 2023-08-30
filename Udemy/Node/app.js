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

connection.connect(function(err){
    if (err){
        console.log('Erro ao conectar-se: ' + err.stack);
        return;
    }
    console.log('Conexão bem sucedida. ID: ' + connection.threadId);
});


// CRIANDO DADOS ALEATORIOS DENTRO DE UM ARRAY
var data = []
for (var i = 0; i < 10; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ])
};

// ADICIONADO OS DADOS DO ARRAY, DENTRO DAS TABELAS DO BD
var insert = 'INSERT INTO users VALUES ?'
connection.query(insert, [data], function(err, res){
    console.log(err);
    console.log(res);
});

/* for (x = 0; x < 10; x++){
    var person = {
        email: faker.internet.email(),
        createdAt: faker.date.past()    
    }
    connection.query('INSERT INTO users SET ?', person, function(err, results){
        if(err) throw error;
    });
} */

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