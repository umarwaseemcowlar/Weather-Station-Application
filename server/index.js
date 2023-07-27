const express = require('express');
const app = express();
const port = 3000; // Change this port number if needed

app.get('/', (req, res) => {
    res.send('Hello, Weather Station!');
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
