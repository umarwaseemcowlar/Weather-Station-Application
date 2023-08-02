class Validator {

    static validateSignup(name, email, password) {
        var errors = []
        if (!name) {
            errors.push("missing name field")
        }
        if (!email) {
            errors.push("missing email field")
        }
        if (!password) {
            errors.push("missing password field")
        }
        // if (users.find(user => user.email === email)) {
        //     errors.push("email already exists")
        // }

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

    static validateLogin(_name, email, password) {
        var errors = []
        if (!email) {
            errors.push("missing email field")
        }
        if (!password) {
            errors.push("missing password field")
        }
        // if (!users.find(user => user.email === email)) {
        //     errors.push("email does not exist")
        // }
        // if (users.find(user => user.email === email && user.password !== password)) {
        //     errors.push("password is incorrect")
        // }

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

}

export default Validator