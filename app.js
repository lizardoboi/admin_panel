require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');
const expressLayouts = require('express-ejs-layouts');
const csurf = require('csurf');

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/users');
const authMiddleware = require('./middlewares/auth_mid');

const app = express();

//setup EJS view engine and layouts
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.set('layout', 'layout');
app.use(expressLayouts);

//middleware to parse request bodies and serve static files
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Configure session for user authentication
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
}));

//enable CSRF protection for all POST/PUT/DELETE requests
app.use(csurf());

//make current user and CSRF token available in all views
app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    res.locals.csrfToken = req.csrfToken();
    next();
});

//register authentication and user management routes
app.use('/auth', authRoutes);
app.use('/users', authMiddleware, userRoutes);

//redirect home page to users list if logged in, otherwise to login
app.get('/', (req, res) => {
    if (req.session.user) {
        return res.redirect('/users');
    }
    res.redirect('/auth/login');
});

//handle 404
app.use((req, res) => {
    res.status(404).send('Page not found');
});

//handle CSRF errors
app.use((err, req, res, next) => {
    if (err.code === 'EBADCSRFTOKEN') {
        res.status(403).send('Form tampered with');
    } else {
        console.error(err);
        res.status(500).send('Server error');
    }
});

module.exports = app;