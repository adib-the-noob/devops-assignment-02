const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.json({
    status: "success",
    message: "Hello, from Node App running in Port 3000!",
  })
});

app.listen(port, () => {
  console.log(`Node app listening at http://localhost:${port}`);
});