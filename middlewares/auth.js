const jwt = require('jsonwebtoken');

module.exports = (req, res, next) => {
    const token = req.cookies?.token || req.headers.authorization?.split(' ')[1];

    if (!token) {
        return res.status(401).redirect('/auth/login');
    }

    try {
        let decoded;
        decoded = jwt.verify(token, process.env.JWT_SECRET || 'dev_secret');
        req.user = decoded;
        next();
    } catch (err) {
        return res.status(401).redirect('/auth/login');
    }
};
//TODO
//server works fine, but smth is wrong with redirects, login goes nowhere 