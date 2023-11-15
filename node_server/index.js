const express = require("express");
const mongoose = require("mongoose");
const { urlConnection } = require("./config");
const Product = require("./product");
const app = express();

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

const productDataStore = [];




mongoose.set('strictQuery', true);
mongoose.connect(urlConnection, {
}, (error) => {
    if (!error) {
        console.log("Status", "Connected to mongoose");

        //post API
        app.post("/api/add_product", async (req, res) => {

            const productData = {
                "id": productDataStore.length + 1,
                "productName": req.body.productName,
                "productPrice": req.body.productPrice,
                "productDescription": req.body.productDescription,
            };

            productDataStore.push(productData);
            console.log("final", productData);

            // Mensagem para verificar se foi adicionado com sucesso para o console
            res.status(200).send({
                "status_code": 200,
                "message": "Product added successfully",
                "product": productData
            });
        })

        //get API
        app.get('/api/get_product', (req, res) => {
            if (productDataStore.length > 0) {
                res.status(200).send({
                    'status_code': 200,
                    'products': productDataStore,
                });
            } else {
                res.status(200).send({
                    'status_code': 200,
                    'products': [],
                });
            }
        })

        //update api
        //put method
        // se usar post method, a unica modificação aqui é em app.post("/api/update/:id"...
        // Já no arquivoapi.dart, deve ser alterado http.post(url, body; body....

        app.put("/api/update/:id", (req, res) => {
            // Busca o objeto exato que vai ser alterado
            //req.params.id é String, colocando *1 na frente, ele se torna int
            let id = req.params.id * 1;
            let productToUpdate = productDataStore.find(p => p.id === id);
            let index = productDataStore.indexOf(productToUpdate);

            productDataStore[index] = req.body;

            res.status(200).send({
                "status": 'success',
                "message": "Product updated successfully",
            })
        })

        app.post("/api/delete/:id", (req, res) => {
            let id = req.params.id * 1;
            let productToUpdate = productDataStore.find(p => p.id === id);
            let index = productDataStore.indexOf(productToUpdate);

            productDataStore.splice(index, 1);

            res.status(204).send({
                "status": 'success',
                "message": "Product deleted successfully",
            })
        })




    } else {
        console.log(error.message);
    }
})





// Inicia o servidor
app.listen(2000, () => {
    console.log("listening on port 2000");
})