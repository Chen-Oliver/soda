import React, { Component } from 'react';
import { Button, Card, Row, Col } from 'react-bootstrap';
import { MdFavorite, MdFavoriteBorder} from 'react-icons/md';
import './Recommendations.css';

class Recommendations extends Component{
    constructor(props) {
        super(props);
        this.state={
            outfit:'',
            season:'',
            selectValue:"spring",
            favorites:{}
        };
        this.onChange = this.onChange.bind(this);
        this.getAll = this.getAll.bind(this);
        this.generateFit=this.generateFit.bind(this);
    }
  componentDidMount(){
    this.getAll();
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
    for(let record of resJSON2.records){
      favDict[record._fields[0]].favorite=true;
    }
    // console.log(favDict);
    this.setState({favorites:favDict});
  }
  handleFav=async(event,imageurl)=>{
    //add/remove fav in neo4j database here...
    let temp = this.state.favorites;
    temp[imageurl].favorite=!temp[imageurl].favorite
    this.setState({favorites:temp});
    if(temp[imageurl].favorite){
      (document.getElementById(imageurl).children)[0].setAttribute('d',"M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z")
    }
    else{
      (document.getElementById(imageurl).children)[0].setAttribute('d',"M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z");
    }
    if(temp[imageurl].favorite){//add favorite relation to database
      const response = await fetch('/api/addFavorite/'+this.props.curUser+"/"+encodeURIComponent(imageurl));
      const resJSON = await response.json();
    }
    else{ //remove favorite from database
      const response = await fetch('/api/removeFavorite/'+this.props.curUser+"/"+encodeURIComponent(imageurl));
      const resJSON = await response.json();
    }
  }
  generateFit = async(event)=>{
    this.setState({outfit: <h3>Loading...</h3>});

    let call = '/api/knn/' + this.state.selectValue;

    const response = await fetch(call);
    const resJSON= await response.json();
    console.log(resJSON.replace(/'/g, '"'));
    let processedJson = JSON.parse(resJSON.replace(/'/g, '"'));
    console.log(JSON.stringify(processedJson, null, 4))
    var output = processedJson.map( function( row, i ) {
        return <div><h3>Outfit {i+1}</h3><Row key={i+" cardrow"}>{row.map( function( cell, j ) {
            let img = (
              <Col key={i+" "+j}>
                <Card style={{ width: 'auto',height:'100%'}}>
                <a target="_blank" rel="noopener noreferrer" href={this.state.favorites[cell].websiteurl}><Card.Img className="image" variant="top" src={this.state.favorites[cell].imageurl} /></a>
                <Card.Body>
                  <Card.Title><a target="_blank" rel="noopener noreferrer" href={this.state.favorites[cell].websiteurl}>{this.state.favorites[cell].name}</a>
                  <div>{this.state.favorites[cell].favorite?<span onClick={event=>this.handleFav(event,cell)}>
                    <MdFavorite id={cell}  size={20}/></span>:<span onClick={event=>this.handleFav(event,cell)}>
                    <MdFavoriteBorder id={cell} size={20}/></span>}</div>
                  </Card.Title>
                  <Card.Text>
                  <br/>
                  <strong>{"$" + this.state.favorites[cell].price+"\n"}</strong>
                  {"Color: "+this.state.favorites[cell].color+"\n"}
                  {"Sold by: "+this.state.favorites[cell].brandname+"\n"}
                  {this.state.favorites[cell].type+"\n"}
                  </Card.Text>
                </Card.Body>
                </Card>
              </Col>
                );
            return img
        }.bind(this))}
        </Row></div>
    }.bind(this))
    output=<div className="recs">{output}</div>;
    this.setState({outfit: output});

    // const response = await fetch('/api/getFirst');
    // const resJSON= await response.json();
    // this.setState({random:
    //   <div>
    //     <span>{"\n Type: "+resJSON.type+"\n Name: "}</span>
    //     <a target="_blank" rel="noopener noreferrer" href={resJSON.websiteurl}>{resJSON.name}</a>
    //     <span>{"\n Brand: "+resJSON.brandname+ "\n Price: "+resJSON.price + "\n Gender: "+resJSON.gender}</span>
    //   </div>
    // });

  }

  onChange=(call)=>{
    this.setState({selectValue:call.target.value});
  }

  render(){
    return (
      <div className="App">
        <Button type='submit' onClick={this.generateFit}>Generate outfit</Button>
        <br/>
        <div>
            <select
                value={this.state.selectValue}
                onChange={this.onChange}>
                <option value="spring">Spring</option>
                <option value="summer">Summer</option>
                <option value="fall">Fall</option>
                <option value="winter">Winter</option>
            </select>
        </div>
        {this.state.outfit}
      </div>
    )
  }
}

export default Recommendations
