require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');
const expressLayouts = require('express-ejs-layouts');

const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/users');
const authMiddleware = require('./middlewares/auth');

const app = express();

// Setup view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.set('layout', 'layout');       // express-ejs-layouts will use views/layout.ejs by default
app.use(expressLayouts);

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Session (simple session for auth)
app.use(session({
    secret: process.env.SESSION_SECRET || 'secretkey',
    resave: false,
    saveUninitialized: false,
}));

// Make user available in all views (from session)
app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    next();
});

// Routes
app.use('/auth', authRoutes);
app.use('/users', authMiddleware, userRoutes);

// Home redirect to users list (if logged in)
app.get('/', (req, res) => {
    if (req.session.user) {
        return res.redirect('/users');
    }
    res.redirect('/auth/login');
});

// 404 handler
app.use((req, res) => {
    res.status(404).send('Page not found');
});

// Error handler
app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).send('Server error');
});

module.exports = app;
