const { sequelize } = require('./models/index');
const app = require('./app');

const PORT = process.env.PORT;

async function start() {
    try {
        await sequelize.authenticate();
        console.log('Database connection established');

        await sequelize.sync({ alter: true });
        console.log('Database synchronized');

        app.listen(PORT, () => {
            console.log(`Server started on http://localhost:${PORT}`);
        });
    } catch (error) {
        console.error('Unable to start the server:', error);
    }
}

start();