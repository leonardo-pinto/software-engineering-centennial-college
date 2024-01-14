// util method to call controllers and manage return based on statusCode
// I developed this code in a personal project
// https://github.com/leonardo-pinto/api-express-sequelize/blob/main/src/utils/async-wrapper.ts
const asyncWrapper = (handler) => (req, res, next) => {
  Promise.resolve(handler(req, res, next))
    .then((response) => {
      if (response.statusCode <= 299) {
        res.status(response.statusCode).send(response);
      } else {
        res.status(response.statusCode).send({
          error: {
            message: response.message,
            stack: response.stack,
          },
        });
      }
    })
    .catch((err) => next(err));
};

module.exports = asyncWrapper;
