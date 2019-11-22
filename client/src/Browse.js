import React, { Component } from 'react'
import {Form,Col,Button,Table,Card} from 'react-bootstrap';
import './Browse.css'
class Browse extends Component{
  constructor(props){
    super(props);
    this.state = {
      all:["Loading..."]
    }
    this.showAll=this.showAll.bind(this);
  }
  componentDidMount() {
      this.getAll();
  }
  getAll=async(event)=>{
    const response = await fetch('/api/getAll/');
    const resJSON = await response.json();
    this.setState({all:resJSON});
    console.log(resJSON);
  }
  handleFilter=async()=>{

  }
  showAll(){
    if(this.state.all[0]!=="Loading..."){
      return(
        <div id="allCards">
        <Form id="filterClothes" onSubmit={this.handleFilter}>
           <Form.Row>
             <Form.Group as={Col} controlId="filterClothesType">
               <Form.Label>Type:</Form.Label>
               <Form.Control as="select" defaultValue="All" className="filter" name="season" required>
                 <option>All</option>
                 <option>Coat</option>
                 <option>Jacket</option>
                 <option>Pants</option>
                 <option>Shirt</option>
                 <option>Shoes</option>
                 <option>Sweater</option>
               </Form.Control>
             </Form.Group>
           </Form.Row>
           <Form.Row>
             <Form.Group as={Col} controlId="formGridDelWebsiteURL">
               <Form.Label>Colors</Form.Label>
               <Form.Control type="text"/>
             </Form.Group>
           </Form.Row>
           <Form.Row>
             <Form.Group as={Col} controlId="formGridDelWebsiteURL">
               <Form.Label>Price</Form.Label>
               <Form.Control type="text"/>
             </Form.Group>
           </Form.Row>
           <Form.Row>
             <Form.Group as={Col} controlId="formGridDelWebsiteURL">
               <Form.Label>Season</Form.Label>
               <Form.Control type="text"/>
             </Form.Group>
           </Form.Row>
           <Form.Row>
             <Form.Group as={Col} controlId="formGridDelWebsiteURL">
               <Form.Label>Brand</Form.Label>
               <Form.Control type="text"/>
             </Form.Group>
           </Form.Row>
           <Button variant="primary" type="submit">
               Filter
           </Button>
         </Form>
        {this.state.all.map((result)=>
        <Card style={{ width: '23rem',height:'100%'}}>
        <a target="_blank" rel="noopener noreferrer" href={result.websiteurl}><Card.Img variant="top" src={result.imageurl} /></a>
        <Card.Body>
          <Card.Title><a target="_blank" rel="noopener noreferrer" href={result.websiteurl}>{result.name}</a></Card.Title>
          <Card.Text>
          <strong>{"$" + result.price+"\n"}</strong>
          {"Color: "+result.color+"\n"}
          {"Sold by: "+result.brandname+"\n"}
          {result.type+"\n"}
          {result.gender+"\n"}
          </Card.Text>
        </Card.Body>
        </Card>
        )}
        </div>
      )
    }
    return(
      <h1>Loading...</h1>
    )
  }
  render(){
    return (
      <div className="App">
        {this.showAll()}
      </div>
    )
  }
}
export default Browse
