const bcrypt = require('bcrypt');
const { User } = require('../models');

//list all users with pagination and sorting
exports.listUsers = async (req, res) => {
    try {
        console.log('User model:', User);
        console.log('findAndCountAll method:', User.findAndCountAll);

        const { count, rows } = await User.findAndCountAll({
            limit: 5,
            offset: (req.query.page - 1) * 5 || 0,
            order: [[req.query.sort || 'username', req.query.order || 'ASC']],
        });

        res.render('dashboard', {
            title: 'Dashboard',
            users: rows,
            currentPage: +req.query.page || 1,
            totalPages: Math.ceil(count / 5),
            sort: req.query.sort || 'username',
            order: req.query.order || 'ASC',
        });
    } catch (err) {
        console.error('Error in listUsers:', err);
        res.status(500).send('Server error');
    }
};

//show details of a single user by ID
exports.showUser = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');

        res.render('user_detail', { user, title: 'User Detail', csrfToken: req.csrfToken() });
    } catch (err) {
        res.status(500).send('Server error userlost');
    }
};

//render the form to add a new user
exports.showAddForm = (req, res) => {
    res.render('user_form', { user: {}, isEdit: false, errors: {}, title: 'Add User', csrfToken: req.csrfToken() });
};

//handle submission of new user form
exports.addUser = async (req, res) => {
    try {
        const { username, password, first_name, last_name, gender, birthdate } = req.body;

        const hash = await bcrypt.hash(password, 10); // Hash password before saving

        await User.create({
            username,
            password: hash,
            first_name,
            last_name,
            gender,
            birthdate,
        });

        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.render('user_form', {
            user: req.body,
            isEdit: false,
            errors: { message: 'Error creating user' },
            title: 'Add User',
            csrfToken: req.csrfToken()
        });
    }
};

//render the form to edit an existing user
exports.showEditForm = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');

        res.render('user_form', { user, isEdit: true, errors: {}, title: 'Add User', csrfToken: req.csrfToken() });
    } catch (err) {
        res.status(500).send('Server error');
    }
};

//handle submission of edited user form
exports.editUser = async (req, res) => {
    try {
        const { username, password, first_name, last_name, gender, birthdate } = req.body;
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');

        //only update password if a new one is provided
        if (password) {
            user.password = await bcrypt.hash(password, 10);
        }

        user.username = username;
        user.first_name = first_name;
        user.last_name = last_name;
        user.gender = gender;
        user.birthdate = birthdate;

        await user.save();
        res.redirect('/users');
    } catch (err) {
        console.error(err);
        res.render('user_form', {
            user: { ...req.body, id: req.params.id },
            isEdit: true,
            errors: { message: 'Error updating user' },
            title: 'Add User',
            csrfToken: req.csrfToken()
        });
    }
};

//delete a user by ID
exports.deleteUser = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');

        await user.destroy();
        res.redirect('/users');
    } catch (err) {
        res.status(500).send('Server error');
    }
};
