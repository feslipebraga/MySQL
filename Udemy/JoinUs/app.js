// criando conexao com o framework express
const express = require('express')
const app = express()
const port = 3000

app.set("view engine", "ejs");

// ACESSE http://localhost:3000/ no navegador para acessar

// conectando com o BD
var mysql = require('mysql2')
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin123',
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
        // res.send('No total, há ' + count + ' usuários cadastrados no banco de dados.');
        res.render("home", { count: count }); // Passando count como variável para o modelo
    });
});

app.get('/joke', (req, res) => {
    res.send('<strong>Por que o programador saiu de casa?</strong> <em>Porque ele perdeu a conexão com a realidade!</em>');
});

app.get('/random_number', (req, res) => {
    var number = Math.floor(Math.random() * 10) + 1;
    res.send('Número: ' + number);
})

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`)
})
