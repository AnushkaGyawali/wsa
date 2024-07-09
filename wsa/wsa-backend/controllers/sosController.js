const Sos = require('../models/Sos');

exports.createSos = async (req, res) => {
    const { lat, lon } = req.body;

    try {
        const newSos = new Sos({
            userId: req.user.id,
            location: { lat, lon },
        });

        const sos = await newSos.save();
        res.json(sos);
    } catch (error) {
        console.error(error.message);
        res.status(500).send('Server error');
    }
};
