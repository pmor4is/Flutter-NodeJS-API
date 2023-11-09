const express = require("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const productData = [];


//post API
app.post("/api/add_product",(req,res => {
    console.log("Result", req.body);

    const productData = {
        "id": productData.lenght+1,
        "productName": req.body.productName,
        "productPrice": req.body.productPrice,
        "productDescription": req.body.productDescription,
    };

    productData.push(productData);
    console.log("final", productData);

    // Mensagem para verificar se foi adicionado com sucesso para o console
    res.status(200).send({
        "status_code": 200,
        "message": "Product added successfully",
        "product": productData
    });
}))


app.listen(2000, () => {
    console.log("listening on port 2000");
})