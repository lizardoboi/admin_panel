const express = require('express');
const router = express.Router();

const userController = require('../controllers/userController');
const validateUser = require('../middlewares/validateUser');
const authMiddleware = require('../middlewares/auth_mid');

router.use(authMiddleware);

router.get('/', userController.listUsers);
router.get('/add', userController.showAddForm);
router.post('/add', validateUser, userController.addUser);

router.get('/:id/edit', userController.showEditForm);
router.post('/:id/edit', validateUser, userController.editUser);
router.post('/:id/delete', userController.deleteUser);

router.get('/:id', userController.showUser);

module.exports = router;
