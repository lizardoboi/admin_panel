const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

router.get('/login', authController.showLoginForm);
router.post('/login', authController.login);
router.post('/logout', authController.logout);

module.exports = router;