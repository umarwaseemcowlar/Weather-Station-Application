import Router from 'express';
const router = Router();

import BCRYPT from 'bcrypt';

import Validator from '../helpers/validator.js'
import JwtHelper from '../helpers/jwt_helper.js';
import users from '../controllers/users_list.js';

router.post('/signup', async (req, res) => {

    try {
        // receive request body
        const { name, email, password } = req.body;

        // validate request body
        var validationResult = Validator.validateSignup(name, email, password)


        if (validationResult.success == false) {
            return res.status(400).json({
                success: validationResult.success,
                errors: validationResult.errors,
            })
        }

        // email already exists validation
        if (users.find(user => user.email === email)) {
            return res.status(400).json({
                success: false,
                errors: ["email already exists"],
            })
        }

        // action based on validation result
        const hashedPassword = await BCRYPT.hash(password, 5);

        const newUser = {
            id: "1",
            name: name,
            email: email,
            password: hashedPassword,
        }

        users.push(newUser)

        const jwtAccessToken = JwtHelper.generateToken({ email: email, name: name })

        return res.status(200).json({
            success: validationResult.success,
            accessToken: jwtAccessToken,
        })
    } catch (error) {
        return res.status(500).json({
            success: false,
            errors: [error.message],
        })
    }
})


router.post('/login', async (req, res) => {
    try {
        // receive request body
        const { name, email, password } = req.body

        // validate request body
        var validationResult = Validator.validateLogin(name, email, password)

        if (validationResult.success == false) {
            return res.status(400).json({
                success: validationResult.success,
                errors: validationResult.errors,
            })
        }

        // email does not exist validation and password is incorrect validation
        const user = users.find(user => user.email === email);
        if (!user) {
            return res.status(400).json({
                success: false,
                errors: ["email does not exist"],
            })
        }

        const isValidPassword = await BCRYPT.compare(password, user.password);

        if (!isValidPassword) {
            return res.status(400).json({
                success: false,
                errors: ["password is incorrect"],
            })
        }

        // action based on validation result
        const jwtAccessToken = JwtHelper.generateToken({ email: email, name: name })

        return res.status(200).json({
            success: validationResult.success,
            accessToken: jwtAccessToken,
        })

    } catch (error) {
        return res.status(500).json({
            success: false,
            errors: [error.message],
        })
    }
})

export default router;