// criando conexao com o framework express
const express = require('express')
const app = express()
const port = 3000

// fazendo comunição com o arquivo home.ejs da pasta views
app.set("view engine", "ejs");

// Criando bodyParser para converter o body da requisição em JSON.
var bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({extended: true}))

// Liberando acesso ao express a pasta public
app.use(express.static(__dirname + "/public"))

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
        res.render("home", { count: count }); // Passando count como variável para o modelo
    });
});

app.post('/register', function(req, res){
    var person = {
        email: req.body.email
    };
    connection.query('INSERT INTO users SET ?', person, function(err, results){
        if(err) throw err;
        res.redirect('/')
    });
});

/*
app.post('/register', function(req, res){
    var email = req.body.email;
    var q = 'INSERT INTO users(email) VALUES (?)';
    connection.query(q, [email], function(err, results){
        if(err) throw err;
        res.redirect('/')
    });
});
*/

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
