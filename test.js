const express = require('express');
const cors = require('cors');
// Create the server
const app = express();


app.get('/api/knn/:season', knn);

async function knn(req, res) {
  // using spawn instead of exec, prefer a stream over a buffer
  // to avoid maxBuffer issue
  var spawn = require("child_process").spawn;
  var process = spawn('python3', ["nn/cnn_code/knn.py", req.params.season]);
  console.log("wtf");
  await process.stdout.on('data', function (data) {
      console.log(data.toString())
      res.send(data.toString());
  });
}

async function wrap()

// handleSignup=async()=>{
//   const response = await fetch('/api/knn/winter');
//   const resJSON = await response.json();
// }
// handleSignup()
req = {'params':{'season':'winter'}}
knn(req, 0)
