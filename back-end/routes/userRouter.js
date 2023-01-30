const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

module.exports = function userRouter(app, db) {

    app.get("/users", async (req, res) => {
        const allUsers = await db.query(`SELECT * FROM users`)
        res.send(allUsers)

    })

    app.post('/signup', async (req, res) => {
        // const firstname = req.body.firstname
        // const lastname = req.body.lastname
        const email = req.body.email
        const password = req.body.password

        bcrypt.hash(password, 10, (err, hash) => {
            if (err) {
                return res.status(500).json({
                    error: err
                })
            }

            else {
                db.query('INSERT INTO users (email, password) VALUES (?, ?)', [email, hash])
            }

        })

    })

    app.post('/login', async (req, res) => {

        try {
            const email = req.body.email
            const password = req.body.password

            if (email === undefined) {
                res.send("L'adresse email ne peut pas être vide")
            } else if (password === undefined) {
                res.send("Le mot de passe ne peut pas être vide")
            } else {
                const userToCheck = await db.query(`SELECT * FROM users WHERE email = "${email}"`)
                let user = userToCheck[0]

                if (userToCheck.length < 1) {
                    res.send("Adresse email incorrecte")
                } else {
                    bcrypt.compare(password, user.password, (err, result) => {
                        if (err) {
                            console.log(err)
                            res.status(401).json({ message: "Mot de passe incorrect" })
                        } else if (result) {

                            jwt.sign({ id: user.user_id }, "ThereShouldBeABetterWayToHideThat", { expiresIn: 36000 }, (err, token) => {

                                if (err) console.log(err)
                                else res.send({
                                    token: token
                                })
                            });

                        } else {
                            res.json("Mot de passe incorrect");
                        }
                    })
                }
            }
        } catch (error) {
            console.log(error)
        }

    })
}