/**
 * Cloud Function.
 *
 * @param {object} event The Cloud Functions event.
 * @param {function} callback The callback function.
 */
exports.helloWorld = function helloWorld (event, callback) {
    console.log(`My Cloud Function: ${JSON.stringify(event.data.message)}`);
    callback();
  };