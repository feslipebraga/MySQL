// criando conexao com o framework express
const express = require('express')
const app = express()
const port = 3000


// conectando com o BD
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


// utilizando e manipulando o express
app.get('/', (req, res) => {
    // Encontre o número de usuários no BD.
    var q = 'SELECT COUNT(*) as count FROM users'
    connection.query(q, function(err, results){
        if (err) throw err;
        var count = results[0].count;
        res.send('No total, há ' + count + ' usuários cadastrados no banco de dados.');
    });
});

app.get('/joke', (req, res) => {
    res.send('What do you call a dog that does trick magics? A labracadabrador.');
});

app.get('/random_number', (req, res) => {
    var number = Math.floor(Math.random() * 10) + 1;
    res.send('Número: ' + number);
})

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`)
})
