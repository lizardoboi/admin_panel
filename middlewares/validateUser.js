//middleware for validating user input before creating or updating a user
module.exports = (req, res, next) => {
    const { username, password, first_name, last_name, gender, birthdate } = req.body;

    const errors = [];

    const isEdit = !!req.params.id;

    if (!username || typeof username !== 'string' || username.trim() === '') {
        errors.push('Username is required and must be a non-empty string.');
    }

    //validate password (minimum 6 characters)
    if (!isEdit) {
        if (!password || typeof password !== 'string' || password.length < 6) {
            errors.push('Password is required and must be at least 6 characters.');
        }
    } else {
        if (password && typeof password === 'string' && password.trim() !== '' && password.length < 6) {
            errors.push('Password must be at least 6 characters if provided.');
        }
    }

    if (!first_name || typeof first_name !== 'string' || first_name.trim() === '') {
        errors.push('First name is required and must be a non-empty string.');
    }

    if (!last_name || typeof last_name !== 'string' || last_name.trim() === '') {
        errors.push('Last name is required and must be a non-empty string.');
    }

    if (!gender || !['male', 'female'].includes(gender)) {
        errors.push('Gender must be one of: male, female.');
    }

    if (!birthdate || isNaN(Date.parse(birthdate))) {
        errors.push('Birthdate must be a valid date in YYYY-MM-DD format.');
    }

    //if any errors found, return 400 with error messages
    if (errors.length > 0) {
        return res.status(400).json({ errors });
    }

    //all validations passed
    next();
};
