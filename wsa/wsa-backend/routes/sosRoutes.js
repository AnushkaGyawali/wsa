const express = require('express');
const router = express.Router();
const sosController = require('../controllers/sosController');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/create', authMiddleware, sosController.createSos);

module.exports = router;
