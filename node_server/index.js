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

            console.log("Result", req.body);

            let data = Product(req.body);

            try {
                let dataToStore = await data.save();
                res.status(200).json(dataToStore);
            } catch (error) {
                res.status(400).json({
                    'status': error.message,
                })
            }

            // ABAIXO: ALGORITMO UTILIZADO PARA TESTAR API LOCALMENTE, UTILIZANDO MÉTODO POST
            // const productData = {
            //     "id": productDataStore.length + 1,
            //     "productName": req.body.productName,
            //     "productPrice": req.body.productPrice,
            //     "productDescription": req.body.productDescription,
            // };

            // productDataStore.push(productData);
            // console.log("final", productData);

            // res.status(200).send({
            //     "status_code": 200,
            //     "message": "Product added successfully",
            //     "product": productData
            // });
        })

        //get API
        app.get('/api/get_product', async (req, res) => {
            try {
                let data = await Product.find();
                res.status(200).json(data);

            } catch (error) {
                res.status(500).json(error.message)
            }

            // ABAIXO: ALGORITMO UTILIZADO PARA TESTAR API LOCALMENTE, UTILIZANDO MÉTODO GET
            // if (productDataStore.length > 0) {
            //     res.status(200).send({
            //         'status_code': 200,
            //         'products': productDataStore,
            //     });
            // } else {
            //     res.status(200).send({
            //         'status_code': 200,
            //         'products': [],
            //     });
            // }
        })

        // Método para buscar um objeto específico
        app.get('/api/get_product/:id', async (req, res) => {
            try {
                let data = await Product.findById(req.params.id);
                res.status(200).json(data);

            } catch (error) {
                res.status(500).json(error.message)
            }

        })

        // UPDATE API

        app.patch("/api/update/:id", async (req, res) => {
            let id = req.params.id;
            let updatedData = req.body;
            let options = { new: true };

            try {
                const data = await Product.findByIdAndUpdate(id, updatedData, options);
                res.send(data);

            } catch (error) {
                res.send(error.message);
            }


            // ABAIXO: ALGORITMO UTILIZADO PARA TESTAR API LOCALMENTE, UTILIZANDO MÉTODO PUT
            // Put method
            // Se usar post method, a unica modificação aqui é em app.post("/api/update/:id"...
            // Já no arquivoapi.dart, deve ser alterado http.post(url, body; body....
            // Busca o objeto exato que vai ser alterado
            // req.params.id é String, colocando *1 na frente, ele se torna int
            // let id = req.params.id * 1;
            // let productToUpdate = productDataStore.find(p => p.id === id);
            // let index = productDataStore.indexOf(productToUpdate);

            // productDataStore[index] = req.body;

            // res.status(200).send({
            //     "status": 'success',
            //     "message": "Product updated successfully",
            // })
        })

        // DELETE API
        app.delete("/api/delete/:id", async (req, res) => {
            
            let id = req.params.id;
            try {
                const data = await Product.findByIdAndDelete(id);
                res.json({
                    'status': "Deleted the product ${data.productName} from database",
                });
            } catch (error) {
                res.json(error.message);
            }
            
            // ABAIXO: ALGORITMO UTILIZADO PARA TESTAR API LOCALMENTE, UTILIZANDO MÉTODO POST
            // let id = req.params.id * 1;
            // let productToUpdate = productDataStore.find(p => p.id === id);
            // let index = productDataStore.indexOf(productToUpdate);

            // productDataStore.splice(index, 1);

            // res.status(204).send({
            //     "status": 'success',
            //     "message": "Product deleted successfully",
            // })
        })

    } else {
        console.log(error.message);
    }
})





// Inicia o servidor
app.listen(2000, () => {
    console.log("listening on port 2000");
})