require('dotenv').config();
const { Sequelize } = require('sequelize');
const UserModel = require('./user');

const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASS,
    {
        host: process.env.DB_HOST,
        port: process.env.DB_PORT || 5432,
        dialect: 'postgres',
        logging: false,
    }
);

// Инициализируем модели
const User = UserModel(sequelize);

// Экспортируем sequelize и модели
module.exports = {
    sequelize,
    User,
};