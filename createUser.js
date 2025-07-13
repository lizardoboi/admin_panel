require('dotenv').config();
const bcrypt = require('bcrypt');
const { sequelize, User } = require('./models');

async function createAdminUser() {
    try {
        await sequelize.authenticate();
        console.log('Connected to DB');

        const passwordHash = await bcrypt.hash('admin123', 10);

        const user = await User.create({
            username: 'admin',
            password: passwordHash,
            first_name: 'Admin',
            last_name: 'User',
            gender: 'male',
            birthdate: '1990-01-01',
        });

        console.log('Admin user created:', user.username);
        process.exit(0);
    } catch (err) {
        console.error('Error creating user:', err);
        process.exit(1);
    }
}

createAdminUser();
