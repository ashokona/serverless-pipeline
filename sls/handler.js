'use strict';

module.exports.endpoint = (event, context, callback) => {
  const response = {
    statusCode: 200,
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Credentials': true,
      'foo':'tet'
    },
    body: JSON.stringify({
      message: `Hello, the current time is ${new Date().toTimeString()}.`,
      event: event.headers
    }),
  };

  callback(null, response);
};
