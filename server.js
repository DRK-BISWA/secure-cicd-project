const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('<h1>DevSecOps Pipeline Successful! ✅</h1><p>Your Node.js app is running securely in a Docker Container.</p>');
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
