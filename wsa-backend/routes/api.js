const express = require('express');
const router = express.Router();
const sosController = require('../controllers/sosController');

router.post('/sos', sosController.triggerSOS);

module.exports = router;
