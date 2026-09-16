const fs = require('fs');
const path = require('path');
const jsonServer = require('json-server');

// O banco usado em aula fica local; cadastros e senhas nao vao para o GitHub.
const banco = path.join(__dirname, 'db.local.json');
if (!fs.existsSync(banco)) {
  fs.copyFileSync(path.join(__dirname, 'db.json'), banco);
}
const servidor = jsonServer.create();
servidor.use(jsonServer.defaults({ logger: false }));
servidor.use(jsonServer.rewriter(require('./routes.json')));
servidor.use(jsonServer.bodyParser);
servidor.use(jsonServer.router(banco));
servidor.listen(3000, '0.0.0.0', () => console.log('JSON Server na porta 3000'));
