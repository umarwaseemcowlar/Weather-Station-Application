import express from 'express';
const app = express();

import UserModel from "./models/user_model.js"

// pick port from env
const PORT = process.env.PORT || 3000;
const HOST = "http://localhost"

app.use(express.json())

app.get('/', (req, res) => {
    res.send('Hello, Weather Station');
});

var users = [
    new UserModel("1", "John Doe", "john@gmail.com", "password"),
]

app.post('/signup', (req, res) => {

    // validate request body
    var body = req.body

    // for each null field, add a message to the error array
    var errors = []
    if (!body.name) {
        errors.push("missing name field")
    }
    if (!body.email) {
        errors.push("missing email field")
    }
    if (!body.password) {
        errors.push("missing password field")
    }
    // if (body.password.length < 8) {
    //     errors.push("password must be at least 8 characters")
    // }
    if (users.find(user => user.email === body.email)) {
        errors.push("email already exists")
    }

    // if there are any errors, return them
    if (errors.length > 0) {
        res.status(400).json({
            success: false,
            errors,
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

    res.status(200).json({
        success: true,
        newUser,
    })
})

app.post('/login', (req, res) => {
    // validate request body
    var body = req.body

    // for each null field, add a message to the error array
    var errors = []
    if (!body.email) {
        errors.push("missing email field")
    }
    if (!body.password) {
        errors.push("missing password field")
    }

    // if there are any errors, return them
    if (errors.length > 0) {
        res.status(400).json({
            errors,
        })
        return
    }

    // check if email and password match
    var user = users.find(user => user.email === body.email)
    if (!user) {
        res.status(400).json({
            errors: ["this email does not exist"],
        })
        return
    }

    if (user.password !== body.password) {
        res.status(400).json({
            errors: ["password incorrect"],
        })
        return
    }

    res.status(200).json({
        success: true,
        user,
    })
})

app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});
