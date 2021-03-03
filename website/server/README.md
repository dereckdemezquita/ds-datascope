# expressJS MongoDB tutorial

```bash
npm init --y
touch server.js
npm install express --save
```

```js 
app.listen(3000, () => {
    console.log("Listening on port: 3000") // localhost:3000
})

// Handle a GET request
app.get(endpoint, callback) 
    // endpoint is the target (everything after /) eg: localhost:3000/account.html
    // callback tells the server what to do for that endpoint; two arguments - request, reseponse

app.get("/", (req, res) => {
    res.send("Hello world.")
});
```