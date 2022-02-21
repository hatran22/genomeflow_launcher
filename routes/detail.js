var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.locals.DB.query(`SELECT sno, sample_name, file_name, file_status, file_access_count, created_datetime, completed_datetime, queue, result_path, error_reason FROM logger
  WHERE job_sno=${req.query.sno};`, (err, result) => {
    res.render('detail/detail', { data: result });
  })
});

module.exports = router;
