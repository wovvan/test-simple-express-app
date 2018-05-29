'use strict';

const express = require('express');

// Constants
const PORT = 3000;

// App
const app = express();
app.get('/', (req, res) => {
    res.send('Hello world');
});

app.get('/ping', (req, res) => {
    res.send('pong 2');
});

app.listen(PORT);
console.log(`Running on port ${PORT}`);