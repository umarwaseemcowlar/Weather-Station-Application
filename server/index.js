import express from 'express';
const app = express();

import UserModel from "./models/user_model.js"
import Validator from "./helpers/validator.js"
import users from "./controllers/users_list.js"

// pick port from env
const PORT = process.env.PORT || 3000;
const HOST = "http://localhost"

app.use(express.json())

app.get('/', (req, res) => {
    res.send('Hello, Weather Station');
});



app.post('/signup', (req, res) => {

    try {
        // validate request body
        var body = req.body

        var validationResult = Validator.validateSignup(body)

        if (validationResult.success == false) {
            res.status(400).json({
                success: validationResult.success,
                errors: validationResult.errors,
            })
            return
        }

        // create a new user
        const newUser = new UserModel(
            "1",
            req.body.name,
            req.body.email,
            req.body.password
        )

        users.push(newUser)

        res.status(200).json({
            success: validationResult.success,
            user: newUser,
        })
    } catch (error) {
        res.status(500).json({
            success: false,
            errors: [error.message],
        })
    }
})

app.post('/login', (req, res) => {
    try {
        // validate request body
        var body = req.body

        var validationResult = Validator.validateLogin(body)

        if (validationResult.success == false) {
            res.status(400).json({
                success: validationResult.success,
                errors: validationResult.errors,
            })
            return
        }

        res.status(200).json({
            success: validationResult.success,
            user: validationResult.user,
        })

    } catch (error) {
        res.status(500).json({
            success: false,
            errors: [error.message],
        })
    }
})

app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});
