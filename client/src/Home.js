import React, { Component } from 'react'
import {Form,Row,Col,Button,Table,Card,Tabs,Tab} from 'react-bootstrap';
import './Home.css'

class Home extends Component{
  constructor(props){
    super(props);
    this.state = {
      all:[],
      loginState:"",
      signupState:""
    }
  }
componentDidMount() {

}


handleLogin=async(event)=>{
  event.preventDefault();
  const loginInputs =event.target.getElementsByClassName("login");
  let username = loginInputs.loginUsername.value;
  let password = loginInputs.loginPassword.value;
  //call backend login here, check success
  const response = await fetch('/api/login/'+username+"/"+password);
  const resJSON = await response.json();
  if(resJSON==="No such user"){
    this.setState({loginState:resJSON});
  }
  else if(resJSON){
    this.props.loginSuccess(username.toLowerCase());
  }
  else{
    this.setState({loginState:"Login Failed. Try Again."});
  }
}
handleSignup=async(event)=>{
  event.preventDefault();
  const signupInputs =event.target.getElementsByClassName("signup");
  let username = signupInputs.signupUsername.value;
  let password = signupInputs.signupPassword.value;
  //send signup info to backend, check success
  const response = await fetch('/api/signup/'+username+"/"+password);
  const resJSON = await response.json();
  if(resJSON==="Username already exists"){
    this.setState({signupState:"Signup Failed. User already exists."});
  }
  else if(resJSON){
    this.props.loginSuccess(username.toLowerCase());
  }
  else{
    this.setState({signupState:"An error occurred. Try again"});
  }
}
  render(){
    return(
      <div className="App">
      <div className="jumbotron d-flex align-items-center">
        <div className="container">
          <h2>SODA</h2>
          <h1 id="intro">{"Hello "+this.props.curUser+"! Welcome!"}</h1>
          {!this.props.loggedIn?<Tabs defaultActiveKey="loginTab" id="login-signup-tabs">
            <Tab eventKey="loginTab" title="Login">
              <Form id="loginForm" onSubmit={this.handleLogin}>
                <Form.Row>
                  <Form.Group as={Col} controlId="formGridLoginUsername">
                    <Form.Label>Username:</Form.Label>
                    <Form.Control className="login" type="text" name="loginUsername" required/>
                  </Form.Group>
                </Form.Row>
                <Form.Row>
                  <Form.Group as={Col} controlId="formGridLoginPassword">
                  <Form.Label>Password:</Form.Label>
                  <Form.Control type="password" className="login" name="loginPassword" required/>
                  </Form.Group>
                </Form.Row>
                <Row>
                <Col>
                <Button variant="primary" name="loginSubmit" type="submit">
                  Login
                </Button>
                </Col>
                </Row>
                <h5>{this.state.loginState}</h5>
              </Form>
            </Tab>
            <Tab eventKey="signupTab" title="Signup">
              <Form id="signupForm" onSubmit={this.handleSignup}>
                <Form.Row>
                  <Form.Group as={Col} controlId="formGridSignupUsername">
                    <Form.Label>Username:</Form.Label>
                    <Form.Control autocomplete="on" className="signup" type="text" name="signupUsername" required/>
                  </Form.Group>
                </Form.Row>
                <Form.Row>
                  <Form.Group as={Col} controlId="formGridSignupPassword">
                  <Form.Label>Password:</Form.Label>
                  <Form.Control autocomplete="on" type="password" className="signup" name="signupPassword" required/>
                  </Form.Group>
                </Form.Row>
                <Row>
                <Col>
                <Button variant="primary" name="signupSubmit" type="submit">
                  Sign Up
                </Button>
                </Col>
                </Row>
                <h5>{this.state.signupState}</h5>
              </Form>
            </Tab>
          </Tabs>:<br/>}
        </div>
      </div>
      <h4 id="footer">Brought to you by Team Goodbois: Oliver Chen, Darren Anco, Allen Chen, Steven Lee</h4>
      </div>

    )
  }
}

export default Home
