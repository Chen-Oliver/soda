import React, { Component } from 'react'
import {Button} from 'react-bootstrap';
import './About.css'
import socketIOClient from "socket.io-client";

var socket;
const PORT = process.env.PORT || 5000;

class About extends Component{
  constructor(props){
    super(props);
    this.state={
      msg:{}
    }
  }
  componentDidMount() {
    var HOST = location.origin.replace(/^http/, 'ws')
    socket = socketIOClient(HOST);
    socket.on('about',(data)=>{
      this.setState({msg:data});
    })
  }
  componentWillUnmount(){
    socket.disconnect();
  }
  sendRequest=async () =>{
    socket.emit('sendRequest',{sender:"personA"});
  }
  acceptRequest=async () =>{
    socket.emit('acceptRequest',{acceptedBy:"personB"});
  }
  render(){
    return(
      <div>
      <h3>About page</h3>
      <h1>{this.state.msg.hello}</h1>
      <Button onClick={this.sendRequest}>Add Friend</Button>
      <Button onClick={this.acceptRequest}>Accept Request</Button>
      </div>
    )
  }
}

export default About
