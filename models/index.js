require('dotenv').config();
const { Sequelize } = require('sequelize');
const UserModel = require('./user_md');

const sequelize = new Sequelize(
    process.env.DB_NAME,
    process.env.DB_USER,
    process.env.DB_PASS,
    {
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        dialect: 'postgres',
        logging: false,
    }
);

const User = UserModel(sequelize);

module.exports = {
    sequelize,
    User,
};
