const express = require('express');
const app = express();

// pick port from env
const PORT = process.env.PORT || 3000;
const HOST = "http://localhost"

app.get('/', (req, res) => {
    res.send('Hello, Weather Station!');
});

app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});
