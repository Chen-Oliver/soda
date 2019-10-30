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
  const response = await fetch('/api/getFirst');
  const resJSON= await response.json();
  this.setState({random:
    <div>
      <span>{"\n Type: "+resJSON.type+"\n Name: "}</span>
      <a target="_blank" rel="noopener noreferrer" href={resJSON.websiteurl}>{resJSON.name}</a>
      <span>{"\n Brand: "+resJSON.brandname+ "\n Price: "+resJSON.price + "\n Gender: "+resJSON.gender}</span>
    </div>
  });
}

async handleSubmitInsert(event) {
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
    
    // const response = await fetch('/api/insert/:name/:type/:gender/:price/:websiteURL/:brand_name/:imageURL/:color/:season');
    // const response = await fetch('/api/insert/'+name+'/'+type+'/'+gender+'/'+price+'/'+websiteURL+'/'+brand_name+'/'+imageURL+'/'+color+'/'+season);
    const response = await fetch('/api/insert')
    const resJSON = await response.json();
    this.setState({text:resJSON.text});

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
      </div>
    )
  }
}
export default App
