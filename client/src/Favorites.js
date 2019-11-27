import React, { Component } from 'react'
import {Form,Col,Button,Table,Card,Tabs,Tab} from 'react-bootstrap';
import './Favorites.css';
import { MdFavorite, MdFavoriteBorder} from 'react-icons/md';
class Favorites extends Component{
  constructor(props){
    super(props);
    this.state = {
      favorites:{},
      friendFavs:[]
    }
    this.showFavs=this.showFavs.bind(this);
  }
  getAll=async(event)=>{
    const response = await fetch('/api/getAll/');
    const resJSON = await response.json();
    let favDict={};
    const response2 = await fetch('/api/getFavorites/'+this.props.curUser);
    const resJSON2 = await response2.json();
    for(let clothing of resJSON){
      favDict[clothing.imageurl]=clothing;
      favDict[clothing.imageurl].favorite=false;
    }
    let fFav=[];
    const response3 = await fetch('/api/getFriendFavorites/'+this.props.curUser);
    const resJSON3 = await response3.json();
    for(let record of resJSON3.records){
      fFav.push([record._fields[0],favDict[record._fields[1]]]);
    }
    for(let record of resJSON2.records){
      favDict[record._fields[0]].favorite=true; //set imageurl fav to be true
    }
    this.setState({favorites:favDict});
    this.setState({friendFavs:fFav})
    console.log(fFav);
  }
  handleRemove=async(event,imageurl)=>{
    //add/remove fav in neo4j database here...
    let temp = this.state.favorites;
    temp[imageurl].favorite=false;
    this.setState({favorites:temp});
    //remove favorite from database
    const response = await fetch('/api/removeFavorite/'+this.props.curUser+"/"+encodeURIComponent(imageurl));
    const resJSON = await response.json();
  }
  showFavs(){
    return(
    <Tabs defaultActiveKey="myFavs" id="favTabs">
    <Tab eventKey="myFavs" title="My Favorites">
    <div className="allCards">
      {Object.keys(this.state.favorites).map((result)=>{
      if(this.state.favorites[result].favorite){
      return <Card style={{ width: '23rem',height:'100%'}}>
      <a target="_blank" rel="noopener noreferrer" href={this.state.favorites[result].websiteurl}><Card.Img variant="top" src={this.state.favorites[result].imageurl} /></a>
      <Card.Body>
        <Card.Title><a target="_blank" rel="noopener noreferrer" href={this.state.favorites[result].websiteurl}>{this.state.favorites[result].name}</a>
        </Card.Title>
        <Card.Text>
        <Button variant="danger" onClick={event=>this.handleRemove(event,this.state.favorites[result].imageurl)}>Remove Favorite</Button>
        <br/>
        <strong>{"$" + this.state.favorites[result].price+"\n"}</strong>
        {"Color: "+this.state.favorites[result].color+"\n"}
        {"Sold by: "+this.state.favorites[result].brandname+"\n"}
        {this.state.favorites[result].type+"\n"}
        {this.state.favorites[result].gender+"\n"}
        </Card.Text>
      </Card.Body>
      </Card>}
      else{
        return(null);
      }
    })}
    </div>
  </Tab>
  <Tab eventKey="friendFavs" title="Friend Favorites">
    <div className="allCards">
    {this.state.friendFavs.map((fFav)=>{
    return <Card style={{ width: '23rem',height:'100%'}}>
    <a target="_blank" rel="noopener noreferrer" href={fFav[1].websiteurl}><Card.Img variant="top" src={fFav[1].imageurl} /></a>
    <Card.Body>
      <Card.Title><a target="_blank" rel="noopener noreferrer" href={fFav[1].websiteurl}>{fFav[1].name}</a>
      </Card.Title>
      <Card.Text>
      <br/>
      <strong>{"$" + fFav[1].price+"\n"}</strong>
      {"Color: "+fFav[1].color+"\n"}
      {"Sold by: "+fFav[1].brandname+"\n"}
      {fFav[1].type+"\n"}
      {fFav[1].gender+"\n"}
      <strong>{"Favorited by: "+fFav[0]}</strong>
      </Card.Text>
    </Card.Body>
    </Card>})}
    </div>
  </Tab>
  </Tabs>)
  }
  componentDidMount() {
    this.getAll();
  }
  render(){
    return (
      <div className="App">
        {this.showFavs()}
        <h3 style={{textAlign:"center"}}>Visit Browse to Add Favorites</h3>
      </div>
    )
  }
}
export default Favorites
