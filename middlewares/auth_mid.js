module.exports = (req, res, next) => {
    try {
        if (!req.session.user) {
            return res.redirect('/auth/login');
        }
        req.user = req.session.user; // Optional: for convenience in handlers
        next();
    } catch (err) {
        console.error('Auth middleware error:', err);
        return res.status(500).send('Server error');
    }
};