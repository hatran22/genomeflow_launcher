var express = require('express');
var router = express.Router();
/* GET home page. */
router.get('/', function(req, res, next) {
  res.locals.DB.query('SELECT * FROM job ', (err, result) => {
    res.render('index', { data: result });
  })
});

module.exports = router;

