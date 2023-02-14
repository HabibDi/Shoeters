require('dotenv').config()
const express = require('express')
const app = express()
const mysql = require('promise-mysql')
const cors = require('cors')

const userRoutes = require('./routes/userRouter')
const productRoutes = require('./routes/productRouter')

app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors())

const port = process.env.PORT

const connectionOptions = {
    host: process.env.DB_HOST,
    database: process.env.DATABASE,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    port: process.env.DB_PORT
}

app.listen(port, () => {
    console.log("Scooter, Écouteurs: le port 5000 est guetteur 🎶")
})

mysql.createConnection(connectionOptions)
    .then(async (db) => {

        userRoutes(app, db)
        productRoutes(app, db)


    })
