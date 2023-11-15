const dotenv = require('dotenv');
dotenv.config();
const {
    mongoURL
} = process.env;
module.exports = {
    urlConnection: mongoURL,
}