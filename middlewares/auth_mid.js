//middleware to protect routes and allow access only for logged-in admin users
module.exports = (req, res, next) => {
    try {
        //check if user is authenticated
        if (!req.session.user) {
            return res.redirect('/auth/login');
        }

        //check if the user is an admin
        if (req.session.user.username !== 'admin') {
            return res.status(403).send('Access denied: Admins only');
        }

        //store user data in request for later use
        req.user = req.session.user;

        next();
    } catch (err) {
        console.error('Auth middleware error:', err);
        return res.status(500).send('Server error');
    }
};