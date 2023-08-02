import JWT from 'jsonwebtoken';

class JwtHelper {
    static generateToken(payload) {
        return JWT.sign(payload, process.env.JWT_SECRET, { expiresIn: '1d' });
    }

    static verifyToken(token) {
        return JWT.verify(token, process.env.JWT_SECRET);
    }
}

export default JwtHelper;