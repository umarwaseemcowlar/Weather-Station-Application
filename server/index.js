// library imports
import express from 'express';
const app = express();

import dotenv from 'dotenv';
dotenv.config(); // load env variables

// route imports
import authRoutes from './routes/auth_routes.js';

// pick port from env else default 3000 
const PORT = process.env.PORT || 3000;
const HOST = "http://localhost"


// middle wares
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
// routes
app.use("/auth", authRoutes);

app.get('/', (req, res) => {
    res.send('Hello, Weather Station');
});

app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});

