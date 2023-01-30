module.exports = function productRouter(app, db) {

    //Appelle les informations de tous les produits
    app.get("/products", async (req, res) => {
        const allProducts = await db.query(`SELECT * FROM products`)
        res.send(allProducts)
    })
    //Appelle les informations d'un produit spécifique en utilisant son id
    app.get("/products/:id", async (req, res) => {

        const id = req.params.id
        const product = await db.query(`SELECT * FROM products WHERE product_id = ${id}`)
        res.send(product)
    })
    //Ajoute un nouveau produit vers la base de données
    app.post("/newProduct", async (req, res) => {
        const product = {
            name: req.body.name,
            brand: req.body.brand,
            img: req.body.image,
            price: req.body.price,
            gender: req.body.gender
        }
        await db.query(`INSERT INTO products (product_name, brand_id, product_img, price, gender_id) VALUES (?,?,?,?,?) `, [product.name, product.brand, product.img, product.price, product.gender])
        res.send(product)
    })

}