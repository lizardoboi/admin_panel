module.exports = (req, res, next) => {
    const { username, password, first_name, last_name, gender, birthdate } = req.body;

    const errors = [];

    if (!username || typeof username !== 'string' || username.trim() === '') {
        errors.push('Username is required and must be a non-empty string.');
    }

    if (!password || typeof password !== 'string' || password.length < 6) {
        errors.push('Password is required and must be at least 6 characters.');
    }

    if (gender && !['male', 'female', 'other'].includes(gender)) {
        errors.push('Gender must be one of: male, female, other.');
    }

    if (birthdate && isNaN(Date.parse(birthdate))) {
        errors.push('Birthdate must be a valid date in YYYY-MM-DD format.');
    }

    if (errors.length > 0) {
        return res.status(400).json({ errors });
    }

    next();
};