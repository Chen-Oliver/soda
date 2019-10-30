const express = require('express');
const cors = require('cors');
// Create the server
const app = express();
const { Client } = require('pg');
const path = require('path');


process.on('unhandledRejection', error => {
  // Will print "unhandledRejection err is not defined"
  console.log('unhandledRejection', error.message);
});

// Serve our base route that returns a Hello World greeting
app.get('/api/greet/', cors(), async (req, res, next) => {
  try {
    const greeting={ text: 'Hello World! Welcome to the SODA App' };
    res.json(greeting)
  } catch (err) {
    next(err)
  }
})
// Serve our base route that returns a Hello World greeting
app.get('/api/getFirst/', cors(), async (req, res, next) => {
    const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: true,
    });
    client.connect();
    const {rows} = await client.query('SELECT * FROM clothing;').catch((err)=>console.error(err));
    res.send(rows[Math.floor(Math.random()*100)]);
    client.end();
});

app.get('/api/search/:brandName/:season/', cors(), async (req, res, next) => {
    const client = new Client({
        connectionString: process.env.DATABASE_URL,
        ssl: true,
    });

    client.connect();
    let brandName = "\'" + req.params.brandName + "\'";
    let season = "\'" + req.params.season + "\'";

    const {rows} = await client.query('SELECT name, color, season, websiteUrl FROM clothing NATURAL JOIN colors NATURAL JOIN seasons NATURAL JOIN brands WHERE season = ' + season + " AND brandName = " + brandName + " ORDER BY websiteurl, color;").catch((err)=>console.error(err));
    // res.send(rows.splice(0,5));
    console.log(rows.splice(0,5));
    client.end();
});

app.get('/api/update/:name/:url/', cors(), async (req, res, next) => {
    const client = new Client({
        connectionString: process.env.DATABASE_URL,
        ssl: true,
    });

    client.connect();
    const {rows} = await client.query('UPDATE clothing SET name=\'' + req.params.name + '\' WHERE websiteURL=\'' + decodeURI(req.params.url) + '\';').catch((err)=>console.error(err));
    client.end();
});

// Serve static files from the React frontend app
app.use(express.static(path.join(__dirname, 'client/build')))
// Anything that doesn't match the above, send back index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname + '/client/build/index.html'))
})

// Choose the port and start the server
const PORT = process.env.PORT || 5000
app.listen(PORT, () => {
  console.log(`Mixing it up on port ${PORT}`)
})
