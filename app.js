'use strict';

const express = require('express');

// Constants
const PORT = 3000;

// App
const app = express();
app.get('/', (req, res) => {
    res.send('Hello world\n');
    setTimeout(() => {
        setInterval(() => console.log(new Date()), 1000);
    }, 130000);

});

app.listen(PORT);
console.log(`Running on port ${PORT}`);