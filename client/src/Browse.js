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
  showAll(){
    if(this.state.all[0]!=="Loading..."){
      return(
        <div id="allCards">
        {this.state.all.map((result)=>
        <Card style={{ width: '23rem',height:'100%'}}>
        <a target="_blank" rel="noopener noreferrer" href={result.websiteurl}><Card.Img variant="top" src={result.imageurl} /></a>
        <Card.Body>
          <Card.Title><a target="_blank" rel="noopener noreferrer" href={result.websiteurl}>{result.name}</a></Card.Title>
          <Card.Text>
          {"$" + result.price+"\n"}
          {result.brandname+"\n"}
          {result.type+"\n"}
          {result.gender+"\n"}
          {result.color+"\n"}
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
