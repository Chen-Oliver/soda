import React, { Component } from 'react'
import {Form,Col,Button} from 'react-bootstrap'
import './App.css'

class App extends Component {
  state = {
    text: '',
    random: ''
  }
componentDidMount() {
    this.fetchGreeting();
  }
fetchGreeting = async () => {
    const response = await fetch('/api/greet');
    const resJSON= await response.json();
    this.setState({text:resJSON.text});
  }
fetchRandom = async()=>{
  let url = encodeURIComponent("https://www2.hm.com/en_us/productpage.0456032021.html");
  const response = await fetch('/api/search/H&M/Summer');
  // const response = await fetch('/api/update/newname/' + url + "/");
  const resJSON= await response.json();
  this.setState({random:
    <div>
      <span>{"\n Type: "+resJSON.type+"\n Name: "}</span>
      <a target="_blank" rel="noopener noreferrer" href={resJSON.websiteurl}>{resJSON.name}</a>
      <span>{"\n Brand: "+resJSON.brandname+ "\n Price: "+resJSON.price + "\n Gender: "+resJSON.gender}</span>
    </div>
  });
}
handleSubmitInsert(event) {
    event.preventDefault();
    const insertInputs =event.target.getElementsByClassName("insert");
    console.log("name:"+insertInputs.name.value);
    console.log("type:"+insertInputs.type.value);
    console.log("gender:"+insertInputs.gender.value);
    console.log("price:"+insertInputs.price.value);
    console.log("WebsiteURL:"+insertInputs.websiteURL.value);
    console.log("BrandName:"+insertInputs.BrandName.value);
    //insert query here
    document.getElementById("insertForm").reset();
}
handleSubmitSearch(event) {
    event.preventDefault();
    const searchInputs =event.target.getElementsByClassName("search");
    console.log("BrandName:"+searchInputs.brand.value);
    console.log("Season:"+searchInputs.season.value);
    //search query here
    document.getElementById("searchForm").reset();
}
render() {
    return (
      <div className="App">
      <div className="jumbotron d-flex align-items-center">
        <div className="container">
          <h1>{this.state.text}</h1>
        </div>
      </div>
        <button type='submit' onClick={this.fetchRandom}>Show Random</button>
        <h3>{this.state.random}</h3>
        <Form id="insertForm" onSubmit={this.handleSubmitInsert}>
          <Form.Row>
            <Form.Group as={Col} controlId="formGridInsName">
              <Form.Label>Name:</Form.Label>
              <Form.Control className="insert" type="text" name="name" required/>
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
              <Form.Control className="insert" type="number" step="0.01" name="type" required/>
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
      </div>
    )
  }
}
export default App
