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
  { value: "Red", label: 'Red' },
  { value: "Green", label: 'Green' },
  { value: "Blue", label: 'Blue' },
  { value: "Black", label: 'Black' },
  { value: "White", label: 'White' },
  { value: "Gray", label: 'Gray' },
  { value: "Orange", label: 'Orange' },
  { value: "Yellow", label: 'Yellow' },
  { value: "Purple", label: 'Purple' },
  { value: "Pink", label: 'Pink' },
  { value: "Beige", label: 'Beige' },
  { value: "Burgundy", label: 'Burgundy' },
  { value: "Brown", label: 'Brown' }
]
const priceOptions=[
  { value: "0-25", label: "$25 or lower" },
  { value: "25-50", label: '$25-$50' },
  { value: "50-100", label: '$50-$100' },
  { value: "100-150", label: '$100-$150' },
  { value: "150-250", label: '$150-250' },
  { value: "250-10000", label: '$250 and higher' }
]
const genderOptions=[
  { value:"Male",label:"Male" },
  { value:"Female",label:"Female" }
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
        "actual":["Blue","Beige","Black","Gray","White","Burgundy","Purple","Pink","Green","Brown","Orange","Yellow","Red"], //selected filters for actual color
        "price":["0-25","25-50","50-100","100-150","150-250","250-10000"],//price filters
        "gender":["Male","Female"]
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
    resJSON.sort((a,b)=>a.price-b.price);
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
          if(filterType!=="price")bool=bool||(c[filterType]===option);
          else{
            console.log(option.slice(0,option.indexOf('-')));
            console.log(Number(option.slice(option.indexOf('-')+1)));
            bool=bool||(c[filterType]>=Number(option.slice(0,option.indexOf('-')))&&c[filterType]<=Number(option.slice(option.indexOf('-')+1)));
          }
        })
        return bool;
      })
    }
    if(clothes.length==0){
      this.setState({all:["None"]});
    }
    else{
      clothes.sort((a,b)=>a.price-b.price);
      this.setState({all:clothes});
    }
  }
  /*
  description:
          handle filter change by updating filter state variable and calling
          the applyfilter function
  options: selected options for current filterType
  filterType: type(clothing type),actual(actual color),price(price ranges)
  filterOptions: all the available options for the current filterType
  */
  filterChange=(options,filterType,filterOptions)=>{
    if(options===null || options.length===0){
      options=filterOptions;
    }
    var selected = [];
    options.map((curSelected)=>{
      selected.push(curSelected.value);
    });
    this.setState({filter:{
      ...this.state.filter,
      [filterType]:selected
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
        <div>
        <div className="filter">
        <div>
          <strong>Clothing Types</strong>
          <Select
          options={typeOptions}
          isMulti
          onChange={event=>this.filterChange(event,"type",typeOptions)}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Colors</strong>
          <Select
          options={colorOptions}
          isMulti
          onChange={event=>this.filterChange(event,"actual",colorOptions)}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Price</strong>
          <Select
          options={priceOptions}
          isMulti
          onChange={event=>this.filterChange(event,"price",priceOptions)}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Gender</strong>
          <Select
          options={genderOptions}
          isMulti
          onChange={event=>this.filterChange(event,"gender",genderOptions)}
          closeMenuOnSelect={false}
          />
        </div>
        </div>
        <div id="allCards">
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
