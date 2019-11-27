import React, { Component } from 'react'
import {Form,Row,Col,Button,Table,Card,Tabs,Tab} from 'react-bootstrap';
import './Home.css'

class Home extends Component{
  constructor(props){
    super(props);
    this.state = {
      search:[],
      all:[],
      loginState:"",
      signupState:""
    }
    this.showSearchResults=this.showSearchResults.bind(this);
  }
componentDidMount() {

}

showSearchResults(){
  if(this.state.search.length>0){
    return(
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Name</th>
            <th>Color</th>
            <th>Season</th>
            <th>Website URL</th>
          </tr>
        </thead>
        <tbody>
          {this.state.search.map((result)=><tr>
            <td>{result.name}</td>
            <td>{result.color}</td>
            <td>{result.season}</td>
            <td>{result.websiteurl}</td>
            </tr>
          )}
        </tbody>
      </Table>
    )
  }
}
handleSubmitDelete=async(event)=> {
  event.preventDefault();
  const deleteInputs =event.target.getElementsByClassName("delete");
  let websiteURL = deleteInputs.delWebsiteURL.value;
  websiteURL = encodeURIComponent(websiteURL);

  const response = await fetch('/api/delete/'+websiteURL);
  const resJSON = await response.json();

  console.log("delete: "+resJSON.text);

  document.getElementById("deleteForm").reset();
}

handleSubmitInsert=async(event)=> {
    event.preventDefault();
    const insertInputs =event.target.getElementsByClassName("insert");
    let name = insertInputs.name.value, type = insertInputs.type.value, gender = insertInputs.gender.value, price = insertInputs.price.value,
    websiteURL = insertInputs.websiteURL.value, brand_name = insertInputs.BrandName.value, imageURL = insertInputs.imageURL.value,
    color = insertInputs.color.value, season = insertInputs.season.value;
    console.log("name:"+name);
    console.log("type:"+type);
    console.log("gender:"+gender);
    console.log("price:"+price);
    console.log("WebsiteURL:"+websiteURL);
    console.log("BrandName:"+brand_name);
    //insert query here

    websiteURL = encodeURIComponent(websiteURL);
    imageURL = encodeURIComponent(imageURL);

    // const response = await fetch('/api/insert/:name/:type/:gender/:price/:websiteURL/:brand_name/:imageURL/:color/:season');
    const response = await fetch('/api/insert/'+name+'/'+type+'/'+gender+'/'+price+'/'+websiteURL+'/'+brand_name+'/'+imageURL+'/'+color+'/'+season);
    // const response = await fetch('/api/insert')
    const resJSON = await response.json();
    //this.setState({text:resJSON.text});
    console.log("response: " +  JSON.stringify(resJSON.text));

    document.getElementById("insertForm").reset();
}
handleSubmitSearch=async(event)=> {
    event.preventDefault();
    const searchInputs =event.target.getElementsByClassName("search");
    let brand = searchInputs.brand.value;
    let season = searchInputs.season.value;
    console.log("BrandName:"+searchInputs.brand.value);
    console.log("Season:"+searchInputs.season.value);
    //search query here
    const response = await fetch('/api/search/'+brand+'/'+season);
    const resJSON = await response.json();
    this.setState({search:resJSON});
    document.getElementById("searchForm").reset();
}
handleUpdate=async(event)=>{
  event.preventDefault();
  const updateInputs =event.target.getElementsByClassName("update");
  let name = updateInputs.name.value;
  let websiteURL = updateInputs.websiteURL.value;
  websiteURL=encodeURIComponent(websiteURL);
  document.getElementById("updateForm").reset();
  const response = await fetch('/api/update/'+name+'/'+websiteURL);
  const resJSON = await response.json();
  console.log("update response received:"+resJSON+"\n");
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
    this.props.loginSuccess(username);
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
    this.props.loginSuccess(username);
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
          <h1 id="intro">{"Hello "+this.props.curUser+"! Welcome to the SODA App"}</h1>
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
      <h4>Brought to you by Team Goodbois: Oliver Chen, Darren Anco, Allen Chen, Steven Lee</h4>
      {/*
      <Form id="insertForm" onSubmit={this.handleSubmitInsert}>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsName">
            <Form.Label>Name:</Form.Label>
            <Form.Control className="insert" type="text" name="name" required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsColor">
            <Form.Label>Color:</Form.Label>
            <Form.Control className="insert" type="text" name="color" required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsSeason">
            <Form.Label>Season:</Form.Label>
            <Form.Control as="select" defaultValue="Male" className="insert" name="season" required>
              <option>Fall</option>
              <option>Winter</option>
              <option>Summer</option>
              <option>Spring</option>
            </Form.Control>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsType">
            <Form.Label>Type:</Form.Label>
            <Form.Control className="insert" type="text" name="type" required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsGender">
            <Form.Label>Gender:</Form.Label>
            <Form.Control as="select" defaultValue="Male" className="insert" name="gender" required>
              <option>Male</option>
              <option>Female</option>
            </Form.Control>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsPrice">
            <Form.Label>Price:</Form.Label>
            <Form.Control className="insert" type="number" step="0.01" name="price" required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsURL">
            <Form.Label>Website URL:</Form.Label>
            <Form.Control type="url" className="insert" name="websiteURL" placeholder="https://example.com"
                    pattern="https://.*"
                    required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsImageURL">
            <Form.Label>Image URL:</Form.Label>
            <Form.Control type="url" className="insert" name="imageURL" placeholder="https://example.com"
                    pattern="https://.*"
                    required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridInsBrand">
            <Form.Label>Brand Name:</Form.Label>
            <Form.Control type="text" className="insert" name="BrandName" required/>
          </Form.Group>
        </Form.Row>
        <Button variant="primary" type="submit">
          Insert Clothing
        </Button>
        </Form>

        <Form id="searchForm" onSubmit={this.handleSubmitSearch}>
          <Form.Row>
            <Form.Group as={Col} controlId="formGridSearchBrand">
              <Form.Label>Brand:</Form.Label>
              <Form.Control className="search" type="text" name="brand" required/>
            </Form.Group>
          </Form.Row>
          <Form.Row>
            <Form.Group as={Col} controlId="formGridSearchSeason">
            <Form.Label>Season:</Form.Label>
            <Form.Control as="select" defaultValue="Male" className="search" name="season" required>
              <option>Spring</option>
              <option>Summer</option>
              <option>Fall</option>
              <option>Winter</option>
            </Form.Control>
            </Form.Group>
          </Form.Row>
          <Button variant="primary" type="submit">
            Search
          </Button>
        </Form>
        {this.showSearchResults()}
        <Form id="updateForm" onSubmit={this.handleUpdate}>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridUpdateWebsiteURL">
            <Form.Label>WebsiteURL:</Form.Label>
            <Form.Control className="update" type="text" name="websiteURL" required/>
          </Form.Group>
        </Form.Row>
        <Form.Row>
          <Form.Group as={Col} controlId="formGridUpdateWebsiteURL">
            <Form.Label>Name:</Form.Label>
            <Form.Control className="update" type="text" name="name" required/>
          </Form.Group>
        </Form.Row>
        <Button variant="primary" type="submit">
          Update
        </Button>
        </Form>
        <Form id="deleteForm" onSubmit={this.handleSubmitDelete}>
         <Form.Row>
           <Form.Group as={Col} controlId="formGridDelWebsiteURL">
             <Form.Label>Website URL:</Form.Label>
             <Form.Control type="url" className="delete" name="delWebsiteURL" placeholder="https://example.com"
                     pattern="https://.*"
                     required/>
           </Form.Group>
         </Form.Row>
         <Button variant="primary" type="submit">
             Delete Clothing
         </Button>
       </Form>
       */}
      </div>

    )
  }
}

export default Home