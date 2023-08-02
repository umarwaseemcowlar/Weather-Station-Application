// library imports
import express from 'express';
const app = express();

import dotenv from 'dotenv';
dotenv.config(); // load env variables

// local imports
import authRoutes from './routes/auth_routes.js';
import users from './controllers/users_list.js';

import checkAuthMiddleware from './middlewares/check_auth.js';

// pick port from env else default 3000 
const PORT = process.env.PORT || 3000;
const HOST = "http://localhost"


// middle wares
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
// route middlewares
app.use("/auth", authRoutes);

app.get('/', (req, res) => {
    res.send('Hello, Weather Station');
});


app.get("/allUsers", checkAuthMiddleware, (req, res) => {
    const allUsers = users;
    res.json(allUsers);
})

app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});

