const express = require('express');
const cors = require('cors');
// Create the server
const app = express();
const { Client } = require('pg');
const path = require('path');
const neo4j = require('neo4j-driver').v1;
const bcrypt = require('bcryptjs');
const http = require("http");
const socketIO = require("socket.io");

const PORT = process.env.PORT || 5000

var graphenedbURL = process.env.GRAPHENEDB_BOLT_URL;
var graphenedbUser = process.env.GRAPHENEDB_BOLT_USER;
var graphenedbPass = process.env.GRAPHENEDB_BOLT_PASSWORD;

var driver = neo4j.driver(graphenedbURL, neo4j.auth.basic(graphenedbUser, graphenedbPass));

const server = http.createServer(app);
const io = socketIO(server);
io.on("connection", function(socket) {
    console.log("New client connected");
    socket.on("sendRequest", (data) =>{
      let session = driver.session();
      session
      .run("MATCH (u:User{username:{userParam}}) MATCH (u2:User{username:{userParam2}}) MERGE (u)-[:AcceptRequest]->(u2) MERGE (u)<-[:Pending]-(u2)",{
        userParam:data.target,userParam2:data.sender})
      .then(function(result) {
          session.close();
      })
      .catch(function(error) {
          console.log(error);
      });
      io.sockets.emit('requestReceived',{sender:data.sender,target:data.target});
    });
    socket.on("acceptRequest", (data) => {
      let session = driver.session();
      session
      .run("MATCH (u:User{username:{userParam}}) MATCH (u2:User{username:{userParam2}}) MERGE (u)-[:Friends]-(u2)",{
        userParam:data.acceptor,userParam2:data.requester})
      .then(function(result) {
          session.close();
      })
      .catch(function(error) {
          console.log(error);
      });
      session = driver.session();
      session
      .run("MATCH (u:User{username:{userParam}}) MATCH (u2:User{username:{userParam2}}) MATCH (u)-[r:AcceptRequest]-(u2) MATCH (u)-[r2:Pending]-(u2) DELETE r DELETE r2",{
        userParam:data.acceptor,userParam2:data.requester})
      .then(function(result) {
          session.close();
      })
      .catch(function(error) {
          console.log(error);
      });
      io.sockets.emit('acceptReceived',{acceptor:data.acceptor,requester:data.requester});
    });
    socket.on("disconnect", () => console.log("Client disconnected"));
});
server.listen(PORT, () => console.log(`Listening on port ${PORT}`));
// // Choose the port and start the server
// const server = app.listen(PORT, () => {
//   console.log(`Mixing it up on port ${PORT}`)
// })

process.on('unhandledRejection', error => {
  // Will print "unhandledRejection err is not defined"
  console.log('unhandledRejection', error.message);
});

app.get('/api/addFavorite/:username/:imageurl',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH (u:User {username:{userParam}}) MERGE (c:Clothing {imageurl:{imageParam}}) ON CREATE SET c.isCreated=[true] ON MATCH SET c.isCreated=[true] FOREACH(ifthen in c.isCreated | CREATE (u)-[:Favorite]->(c) REMOVE c.isCreated)",{
userParam:req.params.username.toLowerCase(),imageParam:decodeURI(req.params.imageurl)})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
});

app.get('/api/getFriendFavorites/:username',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH(u:User{username:{userParam}})-[:Friends*1..3]-(u2:User)-[:Favorite]-(c:Clothing) WHERE u2<>u return DISTINCT u2.username,c.imageurl LIMIT 25",{
userParam:req.params.username.toLowerCase()})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
});

app.get('/api/removeFavorite/:username/:imageurl',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH (u:User {username:{userParam}})-[f:Favorite]-(c:Clothing{imageurl:{imageParam}}) Delete f",{
userParam:req.params.username.toLowerCase(),imageParam:decodeURI(req.params.imageurl)})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
});

app.get('/api/getUsers',cors(),async(req,res,next)=> {
  var session = driver.session();
session
  .run("MATCH (u:User) RETURN u.username")
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
});
app.get('/api/getFriends/:username',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH (u:User{username:{userParam}})-[:Friends]-(u2:User) RETURN u2.username",{
    userParam:req.params.username.toLowerCase()})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
})
app.get('/api/getFriendRequests/:username',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH (u:User{username:{userParam}})-[:AcceptRequest]->(u2:User) RETURN u2.username",{
    userParam:req.params.username.toLowerCase()})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
})
app.get('/api/getPending/:username',cors(),async(req,res,next)=>{
  var session = driver.session();
session
  .run("MATCH (u:User{username:{userParam}})-[:Pending]->(u2:User) RETURN u2.username",{
    userParam:req.params.username.toLowerCase()})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
})
app.get('/api/getFavorites/:username',cors(),async(req,res,next)=> {
  var session = driver.session();
session
  .run("MATCH (User {username:{userParam}})-[:Favorite]->(clothing) RETURN clothing.imageurl",{
userParam:req.params.username.toLowerCase()})
  .then(function(result) {
      res.send(result);
      session.close();
  })
  .catch(function(error) {
      console.log(error);
  });
});
app.get('/api/signup/:username/:password',cors(),async(req,res,next)=> {
  bcrypt.hash(req.params.password, 10, function(err, hash) {
    var session = driver.session();
  session
      .run("Merge (n:User {username:{userParam}}) ON CREATE SET n.password={passwordParam},n.found=0 ON MATCH SET n.found=1 RETURN n.username,n.found",{
    userParam:req.params.username.toLowerCase(),passwordParam:hash})
      .then(function(result) {
          if(result.records[0]._fields[1]["low"]){
            res.json("Username already exists");
            session.close();
          }
          else{
            res.send(true);
            session.close();
          }
      })
      .catch(function(error) {
          res.send(false);
          console.log(error);
      });
  });
});
app.get('/api/login/:username/:password',cors(),async(req,res,next)=> {
    var session = driver.session();
  session
      .run("MATCH (user:User {username:{userParam}}) RETURN user.password",{
    userParam:req.params.username.toLowerCase()})
      .then(function(result) {
          if(result.records.length===0){
            res.json("No such user");
            session.close();
          }
          bcrypt.compare(req.params.password, result.records[0]._fields[0], function(err, pRes) {
            if(pRes) {
              // password match
              res.send(true);
              session.close();
            } else {
             // password doesn't match
             res.send(false);
             session.close();
            }
          });
      })
      .catch(function(error) {
          res.send(false);
          console.log(error);
      });
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

app.get('/api/similar/:price/:color/:type/:gender', cors(), async (req, res, next) => {
  const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: true,
    });
    client.connect();
  const {rows} = await client.query('SELECT DISTINCT * FROM clothing NATURAL JOIN colors NATURAL JOIN brands WHERE type='+"\'"+req.params.type +"\'"+ "AND gender="+"\'"+req.params.gender+"\'"+"AND( actual="+"\'"+req.params.color +"\'"+"OR ABS(price - "+"\'"+req.params.price+"\'"+") <= 10) ORDER BY price ASC").catch((err)=>console.error(err));
  res.send(rows);
  client.end();
});

app.get('/api/delete/:websiteURL/', cors(), async (req, res, next) => {
  const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: true,
    });
    client.connect();

  var websiteURL = decodeURIComponent(req.params.websiteURL);
  text = 'DELETE FROM clothing WHERE websiteURL = $1';
  values = [websiteURL];
  await client.query(text, values).catch((err)=>console.error(err));

  const message = { text: "deleted "+websiteURL};
  res.json(message);
  client.end();
});

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
app.get('/api/insert/:name/:type/:gender/:price/:websiteURL/:brand_name/:imageURL/:color/:season/', cors(), async (req, res, next) => {
// app.get('/api/insert/', cors(), async (req, res, next) => {

  const client = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: true,
  });
  client.connect();
  // var message = 'hello';

  var websiteURL = decodeURI(req.params.websiteURL);
  var imageURL = decodeURI(req.params.imageURL);
  // // check price range
  var price_range = '$$';
  var text = 'INSERT INTO brands(brandName, priceRange)  VALUES($1, $2);';
  var values = [req.params.brand_name, price_range];
  await client.query(text, values).catch((err)=>console.error(err));

  text = 'INSERT INTO clothing(name, type, gender, price, websiteURL, brandName) VALUES($1, $2, $3, $4, $5, $6);';
  values = [req.params.name, req.params.type, req.params.gender, req.params.price, websiteURL, req.params.brand_name]
  await client.query(text, values).catch((err)=>console.error(err));

  text =  'INSERT INTO colors(websiteURL, imageURL, color) VALUES($1, $2, $3);';
  values = [websiteURL, imageURL, req.params.color];
  await client.query(text, values).catch((err)=>console.error(err));

  text = 'INSERT INTO seasons(websiteURL, season) VALUES($1, $2);';
  values = [websiteURL, req.params.season];
  await client.query(text, values).catch((err)=>console.error(err));

  const message = { text: "should've inserted " + req.params.name + req.params.type + req.params.gender + req.params.price + req.params.websiteURL +
   req.params.brand_name + imageURL + req.params.color + req.params.season };
  res.json(message);
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
    res.send(rows.splice(0,5));
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

//get all pieces of clothing from database
app.get('/api/getAll/', cors(), async (req, res, next) => {
    const client = new Client({
        connectionString: process.env.DATABASE_URL,
        ssl: true,
    });

    client.connect();

    const {rows} = await client.query('SELECT DISTINCT * FROM clothing NATURAL JOIN colors NATURAL JOIN brands ORDER BY type ASC').catch((err)=>console.error(err));
    // res.send(rows.splice(0,5));
    // res.send(rows.splice(0,5));
    res.send(rows);
    client.end();
});
//get all pieces of clothing from database
app.get('/api/filterAll/:types/:colors', cors(), async (req, res, next) => {
    const client = new Client({
        connectionString: process.env.DATABASE_URL,
        ssl: true,
    });
    let types = req.params.types;
    let q = 'SELECT DISTINCT * FROM clothing NATURAL JOIN colors NATURAL JOIN brands';
    if(types!='')q+=' WHERE '+types;
    client.connect();
    const {rows} = await client.query(q).catch((err)=>console.error(err));
    res.send(rows);
    client.end();
});

app.get('/api/knn/:season', cors(), async (req, res, next) => {
  // var spawn = require("child_process").spawn;
  // var process = spawn('python3', ["nn/cnn_code/knn.py", req.params.season]);
  // process.stdout.on('data', function (data) {
  //     console.log(data.toString())
  //   res.json(data.toString());
  // });
  let list = [
    [
      6, 9, 6, 9
    ],
    [
      4, 2, 0, 4
    ]
  ]
  res.json(list)
});

// function knn(req, res) {
//   console.log("rec!!")
//   var spawn = require("child_process").spawn;
//   var process = spawn('python3', ["nn/cnn_code/knn.py", req.params.season]);
//   process.stdout.on('data', function (data) {
//       console.log(data.toString())
//     res.send(data.toString());
//   });
// }

// Serve static files from the React frontend app
app.use(express.static(path.join(__dirname, 'client/build')))
// Anything that doesn't match the above, send back index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname + '/client/build/index.html'))
})
