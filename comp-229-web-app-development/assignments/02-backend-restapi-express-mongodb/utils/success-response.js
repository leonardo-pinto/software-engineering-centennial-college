// adapted from https://github.com/leonardo-pinto/api-express-sequelize/blob/main/src/utils/success-response.ts

class SuccessResponse {
  statusCode;
  data;

  constructor(statusCode, data) {
    this.statusCode = statusCode;
    this.data = data;
  }
}

module.exports = SuccessResponse;
