const User = require('../models/user');
const bcrypt = require('bcrypt');

exports.listUsers = async (req, res) => {
    const { page = 1, sort = 'username', order = 'ASC' } = req.query;
    const limit = 5;
    const offset = (page - 1) * limit;

    try {
        const { count, rows } = await User.findAndCountAll({
            limit,
            offset,
            order: [[sort, order]],
        });
        res.render('dashboard', {
            users: rows,
            currentPage: +page,
            totalPages: Math.ceil(count / limit),
            sort,
            order,
        });
    } catch (err) {
        res.status(500).send('Server error');
    }
};

exports.showUser = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');
        res.render('user_detail', { user });
    } catch (err) {
        res.status(500).send('Server error');
    }
};

exports.showAddForm = (req, res) => {
    res.render('user_form', { user: {}, isEdit: false, errors: {} });
};

exports.addUser = async (req, res) => {
    try {
        const { username, password, first_name, last_name, gender, birthdate } = req.body;

        const hash = await bcrypt.hash(password, 10);

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
        res.render('user_form', { user: req.body, isEdit: false, errors: { message: 'Error creating user' } });
    }
};

exports.showEditForm = async (req, res) => {
    try {
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');
        res.render('user_form', { user, isEdit: true, errors: {} });
    } catch (err) {
        res.status(500).send('Server error');
    }
};

exports.editUser = async (req, res) => {
    try {
        const { username, password, first_name, last_name, gender, birthdate } = req.body;
        const user = await User.findByPk(req.params.id);
        if (!user) return res.status(404).send('User not found');

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
        res.render('user_form', { user: { ...req.body, id: req.params.id }, isEdit: true, errors: { message: 'Error updating user' } });
    }
};

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