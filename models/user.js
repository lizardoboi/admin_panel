const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
    return sequelize.define('User', {
        username: {
            type: DataTypes.STRING,
            unique: true,
            allowNull: false,
            validate: { notEmpty: true },
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        first_name: DataTypes.STRING,
        last_name: DataTypes.STRING,
        gender: DataTypes.ENUM('male', 'female'),
        birthdate: DataTypes.DATEONLY,
    }, {
        tableName: 'users',
        timestamps: false,
    });
};