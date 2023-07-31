import users from "../controllers/users_list.js"

class Validator {

    static validateSignup(body) {
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
        if (users.find(user => user.email === body.email)) {
            errors.push("email already exists")
        }

        // if there are any errors, return them
        if (errors.length > 0) {
            return {
                success: false,
                errors,
            }
        }
        return {
            success: true,
        }
    }

    static validateLogin(body) {
        var errors = []
        if (!body.email) {
            errors.push("missing email field")
        }
        if (!body.password) {
            errors.push("missing password field")
        }
        if (!users.find(user => user.email === body.email)) {
            errors.push("email does not exist")
        }
        if (users.find(user => user.email === body.email && user.password !== body.password)) {
            errors.push("password is incorrect")
        }

        // if there are any errors, return them
        if (errors.length > 0) {
            return {
                success: false,
                errors,
            }
        }
        return {
            success: true,
            user: users.find(user => user.email === body.email),
        }
    }

}

export default Validator