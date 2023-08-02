import JwtHelper from "../helpers/jwt_helper.js";

const checkAuthMiddleware = async (req, res, next) => {
    try {
        const headers = req.headers;
        if (!headers["authorization"]) {
            return res.status(401).json({
                success: false,
                errors: ["No token provided"],
            });
        }

        const tokenFromClient = headers["authorization"].split(" ")[1];

        const user = await JwtHelper.verifyToken(tokenFromClient);
        if (!user) {
            return res.status(401).json({
                success: false,
                errors: ["Unauthorized"],
            });
        }
        else {
            req.body.name = user.name;
            req.body.email = user.email;
            next();
        }
    } catch (error) {
        return res.status(500).json({
            success: false,
            errors: ["Unauthorized"],
        });
    }
}

export default checkAuthMiddleware;