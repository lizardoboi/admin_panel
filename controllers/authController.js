const bcrypt = require('bcrypt');
const { User } = require('../models');

//render login page with CSRF token and no error by default
exports.showLoginForm = (req, res) => {
    res.render('login', { error: null, title: 'Login', csrfToken: req.csrfToken() });
};

//handle login form submission
exports.login = async (req, res) => {
    const { username, password } = req.body;

    try {
        const user = await User.findOne({ where: { username } });

        if (!user) {
            return res.render('login', { error: 'Invalid username or password', title: 'Login', csrfToken: req.csrfToken() });
        }

        //allow login only for admin user
        if (user.username !== 'admin') {
            return res.render('login', { error: 'Access denied. Only admin can log in.', title: 'Login', csrfToken: req.csrfToken() });
        }

        //check password validity
        const valid = await bcrypt.compare(password, user.password);
        if (!valid) {
            return res.render('login', { error: 'Invalid username or password', title: 'Login', csrfToken: req.csrfToken() });
        }

        //store user info in session and redirect to users page
        req.session.user = { id: user.id, username: user.username };
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.render('login', { error: 'Server error', title: 'Login', csrfToken: req.csrfToken() });
    }
};

//handle user logout by destroying session and redirecting to login page
exports.logout = (req, res) => {
    req.session.destroy(() => {
        res.redirect('/auth/login');
    });
};