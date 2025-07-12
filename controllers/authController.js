const bcrypt = require('bcrypt');
const { User } = require('../models');

exports.showLoginForm = (req, res) => {
    res.render('login', { error: null, title: 'Login' });
};

exports.login = async (req, res) => {
    const { username, password } = req.body;

    try {
        const user = await User.findOne({ where: { username } });
        if (!user) {
            return res.render('login', { error: 'Invalid username or password', title: 'Login' });
        }

        const valid = await bcrypt.compare(password, user.password);
        if (!valid) {
            return res.render('login', { error: 'Invalid username or password', title: 'Login' });
        }

        req.session.user = { id: user.id, username: user.username };
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.render('login', { error: 'Server error', title: 'Login' });
    }
};

exports.logout = (req, res) => {
    req.session.destroy(() => {
        res.redirect('/auth/login');
    });
};
