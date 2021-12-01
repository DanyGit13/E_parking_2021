const { Schema, model } = require('mongoose');
const clienteSchema = new Schema({
    nombre: String,
    apellido: String,
    telefono: String,
    email: String,
    id: String,
    contrasena: String,
})

module.exports = model('Cliente', clienteSchema);