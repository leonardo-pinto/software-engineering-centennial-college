// adapted from https://github.com/leonardo-pinto/api-express-sequelize/blob/main/src/utils/api-error.ts

class ApiError extends Error {
  statusCode;
  errors;
  constructor(statusCode, message, errors) {
    super(message);
    this.statusCode = statusCode;

    if (errors) {
      this.errors = errors;
      Error.captureStackTrace(this, this.constructor);
    }
  }
}

class BadRequestError extends ApiError {
  constructor(message, errors) {
    super(400, message, errors);
  }
}

module.exports = { ApiError, BadRequestError };
