const axios = require('axios');

exports.triggerSOS = async (req, res) => {
  try {
    // Logic to handle SOS trigger
    const { phoneNumber } = req.body;

    // Replace with your SMS sending service integration
    const response = await axios.post('https://example.com/sms/send', {
      to: phoneNumber,
      message: 'SOS! I need help.'
    });

    res.status(200).json({ message: 'SOS triggered successfully' });
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Server Error');
  }
};
