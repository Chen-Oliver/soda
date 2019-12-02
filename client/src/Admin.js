import React, { Component } from 'react';
import {Form,Col,Button,Table} from 'react-bootstrap';
import './Admin.css';
class Admin extends Component{
  constructor(props){
    super(props);
    this.state={
      search:[]
    }
    this.showSearchResults=this.showSearchResults.bind(this);
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
  render(){
    return (
      <div className="App">
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
      </div>
    )
  }
}

export default Admin
