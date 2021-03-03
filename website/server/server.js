const express = require("express");
const app = express();
const path = require("path");

app.listen(3000, () => {
    console.log("Listening on port: 3000") // localhost:3000
})

app.get("/", (req, res) => {


    // res.sendFile("index.html")
})

