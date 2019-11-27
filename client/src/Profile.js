import React, { Component } from 'react'
import {Button,ListGroup} from 'react-bootstrap';
import './Profile.css'
import socketIOClient from "socket.io-client";

var socket;
var allUsernames=[];
class Profile extends Component{
  constructor(props){
    super(props);
    this.state={
      allUsers:{},
    }
    this.showUsers=this.showUsers.bind(this);
  }
  getUsers = async () => {
    const response=await fetch('/api/getUsers');
    const resJSON=await response.json();
    const response2=await fetch('/api/getFriendRequests/'+this.props.curUser);
    const resJSON2=await response2.json();
    const response3=await fetch('/api/getPending/'+this.props.curUser);
    const resJSON3=await response3.json();
    const response4=await fetch('/api/getFriends/'+this.props.curUser);
    const resJSON4=await response4.json();
    var users={};
    allUsernames=[];
    for(let record of resJSON.records){
      if(record._fields[0]!==this.props.curUser){
        allUsernames.push(record._fields[0]);
        users[record._fields[0]]="Add Friend";
      }
    }
    for(let record of resJSON2.records){
      users[record._fields[0]]="Friend Request Received";
    }
    for(let record of resJSON3.records){
      users[record._fields[0]]="Request Sent";
    }
    for(let record of resJSON4.records){
      users[record._fields[0]]="Friend";
    }
    // console.log(users);
    this.setState({allUsers:users});
  }
  showUsers(){
    return(
    <div>
    <div>
      <h3>Friends:</h3>
      <ListGroup>
      {allUsernames.map((user)=>{
        if(this.state.allUsers[user]==="Friend"){
          return <ListGroup.Item variant="primary">{user}</ListGroup.Item>
        }
        else{
          return null;
        }
      })}
      </ListGroup>
    </div>
    <div>
    <h3>Users:</h3>
    {allUsernames.map((user)=>{
      if(this.state.allUsers[user]==="Friend Request Received"){
        return <div><ListGroup.Item variant="warning">{user} <Button onClick={event=>this.acceptRequest(event,this.props.curUser,user)}>Accept Friend Request</Button></ListGroup.Item></div>
      }
      else if(this.state.allUsers[user]==="Request Sent"){
        return <div><ListGroup.Item variant="warning">{user} <Button onClick={event=>this.sendRequest(event,this.props.curUser,user)}>{this.state.allUsers[user]}</Button></ListGroup.Item></div>
      }
      else if(this.state.allUsers[user]==="Friend"){
        return null;
      }
      else{
        return <div><ListGroup.Item variant="secondary">{user} <Button onClick={event=>this.sendRequest(event,this.props.curUser,user)}>{this.state.allUsers[user]}</Button></ListGroup.Item></div>
      }
    })}
    </div>
    </div>
  )
  }
  componentDidMount() {
    this.getUsers();
    socket = socketIOClient("https://soda-uiuc.herokuapp.com",{secure: true});
    // socket=socketIOClient("http://127.0.0.1:5000");
    socket.on('requestReceived',(data)=>{
      var temp=this.state.allUsers;
      if(data.target===this.props.curUser){
        // console.log(data);
        temp[data.sender]="Friend Request Received";
        this.setState({allUsers:temp});
      }
    })
    socket.on('acceptReceived',(data)=>{
      var temp=this.state.allUsers;
      if(data.requester===this.props.curUser){
        // console.log(data);
        temp[data.acceptor]="Friend";
        this.setState({allUsers:temp});
      }
    })
  }
  componentWillUnmount(){
    socket.disconnect();
  }
  sendRequest=async (event,sender,target) =>{
    var temp=this.state.allUsers;
    temp[target]="Request Sent";
    this.setState({allUsers:temp});
    socket.emit('sendRequest',{sender:sender,target:target});
  }
  acceptRequest=async (event,acceptor,requester) =>{
    var temp=this.state.allUsers;
    temp[requester]="Friend";
    this.setState({allUsers:temp});
    socket.emit('acceptRequest',{acceptor:acceptor,requester:requester});
  }
  render(){
    return(
      <div>
      {this.showUsers()}
      </div>
    )
  }
}

export default Profile
