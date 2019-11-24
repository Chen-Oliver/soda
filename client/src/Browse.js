import React, { Component } from 'react'
import {Form,Col,Button,Table,Card} from 'react-bootstrap';
import './Browse.css';
import Select from 'react-select';

const typeOptions = [
  { value: "Coat", label: 'Coat' },
  { value: "Jacket", label: 'Jacket' },
  { value: "Pants", label: 'Pants' },
  { value: "Shirt", label: 'Shirt' },
  { value: "Shoes", label: 'Shoes' },
  { value: "Sweater", label: 'Sweater' }
]
const colorOptions = [
  { value: "Blue", label: 'Blue' },
  { value: "Beige", label: 'Beige' },
  { value: "Black", label: 'Black' },
  { value: "Gray", label: 'Gray' },
  { value: "White", label: 'White' },
  { value: "Burgundy", label: 'Burgundy' },
  { value: "Purple", label: 'Purple' },
  { value: "Pink", label: 'Pink' },
  { value: "Green", label: 'Green' },
  { value: "Brown", label: 'Brown' },
  { value: "Orange", label: 'Orange' },
  { value: "Yellow", label: 'Yellow' }
]
var allClothes;
class Browse extends Component{
  constructor(props){
    super(props);
    this.state = {
      all:["Loading"],
      filter:{
        //default filters show all clothes
        "type":["Coat","Jacket","Pants","Shirt","Shoes","Sweater"],  //selected filters for clothing type
        "actual":["Blue","Beige","Black","Gray","White","Burgundy","Purple","Pink","Green","Brown","Orange","Yellow"] //selected filters for actual color
      }
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
    allClothes=resJSON;
  }
  applyFilters=()=>{
    let filters = Object.keys(this.state.filter);
    var clothes=allClothes;
    for(let filterType of filters){//what type of filter: type,color,...
      var bool=false;
      clothes = clothes.filter((c)=>{
        bool=false;
        this.state.filter[filterType].map((option)=>{
          bool=bool||(c[filterType]===option);
        })
        return bool;
      })
    }
    if(clothes.length==0){
      this.setState({all:["None"]});
    }
    else this.setState({all:clothes});
  }
  //update selected type filters state
  typeChanged=(options)=>{
    if(options===null || options.length===typeOptions.length || options.length===0){
      options=typeOptions;
    }
    var selected = [];
    options.map((curSelected)=>{
      selected.push(curSelected.value);
    });
    this.setState({filter:{
      ...this.state.filter,
      type:selected
      }
    },this.applyFilters);
  }
  //update selected actual colors filters state
  colorChanged=(options)=>{
    if(options===null || options.length===typeOptions.length || options.length===0){
      options=colorOptions;
    }
    var selected = [];
    options.map((curSelected)=>{
      selected.push(curSelected.value);
    });
    this.setState({filter:{
      ...this.state.filter,
      actual:selected
      }
    },this.applyFilters);
  }
  showAll(){
    if(this.state.all[0]==="Loading"){
      return(
        <h1>Loading...</h1>
      )
    }
    else{
      return(
        <div id="allCards">
        <div className="filter">
        <div>
          <strong>Clothing Types</strong>
          <Select
          options={typeOptions}
          isMulti
          onChange={this.typeChanged}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Colors</strong>
          <Select
          options={colorOptions}
          isMulti
          onChange={this.colorChanged}
          closeMenuOnSelect={false}
          />
        </div>
        </div>
        {this.state.all.map((result)=>{
        if(result==="None")return <h1 style={{textAlign:"center"}}>No Results Found</h1>
        else{
        return <Card style={{ width: '23rem',height:'100%'}}>
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
        </Card>}
      })}
        </div>
      )
  }
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
