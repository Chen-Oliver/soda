import React, { Component } from 'react';
import {} from 'react-bootstrap';
import './Random.css';
class Random extends Component{
  state={
    random:''
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
  render(){
    return (
      <div className="App">
        <button type='submit' onClick={this.fetchRandom}>Show Random</button>
        <h3>{this.state.random}</h3>
      </div>
    )
  }
}

export default Random
