const express = require('express');
const cors = require('cors');
// Create the server
const app = express();
const { Client } = require('pg');
const path = require('path');

// Serve our base route that returns a Hello World greeting
app.get('/api/greet/', cors(), async (req, res, next) => {
  try {
    const greeting={ text: 'Hello World!' };
    res.json(greeting)
  } catch (err) {
    next(err)
  }
})

// Serve static files from the React frontend app
app.use(express.static(path.join(__dirname, 'client/build')))
// Anything that doesn't match the above, send back index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname + '/client/build/index.html'))
})

const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: true,
});

client.connect();

client.query('CREATE TABLE clothing (name char(100)); INSERT INTO clothing VALUES ("Grey Sweater")', (err, res) => {
  if (err) throw err;
  // for (let row of res.rows) {
  //   console.log(JSON.stringify(row));
  // }
  console.log("Created table and insert grey sweater");
  client.end();
});

// Choose the port and start the server
const PORT = process.env.PORT || 5000
app.listen(PORT, () => {
  console.log(`Mixing it up on port ${PORT}`)
})
