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
// Insert into our database
// app.get('/api/insert/:name/:type/:gender/:price/:websiteURL/:brand_name/:imageURL/:color/:season', cors(), async (req, res, next) => {
app.get('/api/insert', cors(), async (req, res, next) => {
  const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: true,
  });
  client.connect();
  console.log("hello");
  // // check price range
  // price_range = '$$'
  // const {rows1} = await client.query('INSERT INTO brands(brandName, priceRange) \
  // VALUES(' + req.param.brand_name + price_range + ')').catch((err)=>console.error(err));

  // const {rows2} = await client.query('INSERT INTO clothing(name, type, gender, price, websiteURL, brandName) \
  // VALUES(' + req.param.name + req.param.type + req.param.gender + req.param.price + req.param. websiteURL + req.param.brand_name + ')').catch((err)=>console.error(err));
  
  // const {rows3} = await client.query('INSERT INTO colors(websiteURL, imageURL, color) \
  // VALUES(' + req.param.websiteURL + req.param.imageURL + req.param.color + ')').catch((err)=>console.error(err));

  // const {rows4} = await client.query('INSERT INTO seasons(websiteURL, season) \
  // VALUES(' + req.param.websiteURL + req.param.season + ')').catch((err)=>console.error(err));
  
  // const message = { text: "should've inserted " + req.param.name + req.param.type + req.param.gender + req.param.price + req.param.websiteURL +
  //  req.param.brand_name + req.param.imageURL + req.param.color + req.param.season };
  // res.json(message);
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
