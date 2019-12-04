import React, { Component } from 'react'
import {Form,Col,Button,Table,Card} from 'react-bootstrap';
import './Browse.css';
import Select from 'react-select';
import { MdFavorite, MdFavoriteBorder} from 'react-icons/md';
const typeOptions = [
  { value: "Coat", label: 'Coat' },
  { value: "Jacket", label: 'Jacket' },
  { value: "Pants", label: 'Pants' },
  { value: "Shirt", label: 'Shirt' },
  { value: "Shoes", label: 'Shoes' },
  { value: "Sweater", label: 'Sweater' }
]
var brandOptions=[];
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
  { value:"Male",label:"Men" },
  { value:"Female",label:"Women" }
]
var allClothes;
class Browse extends Component{
  constructor(props){
    super(props);
    this.state = {
      all:["Loading"],
      typeOption:null,
      actualOption:null,
      priceOption:null,
      genderOption:null,
      brandOption:null,
      filter:{
        //default filters show all clothes
        "type":["Coat","Jacket","Pants","Shirt","Shoes","Sweater"],  //selected filters for clothing type
        "actual":["Blue","Beige","Black","Gray","White","Burgundy","Purple","Pink","Green","Brown","Orange","Yellow","Red"], //selected filters for actual color
        "price":["0-25","25-50","50-100","100-150","150-250","250-10000"],//price filters
        "gender":["Male","Female"],
        "brandname":[]
      },
      favorites:{}//each time this is updated, update neo4j database as well(remove/add favorite)
    }
    this.showAll=this.showAll.bind(this);
    this.clearFilters=this.clearFilters.bind(this);
  }
  componentDidMount() {
      this.getAll();
      this.getBrands();
  }
  getBrands=async(event)=>{
    const response=await fetch('/api/getBrands');
    const resJSON=await response.json();
    var temp = [];
    for(let brand of resJSON){
      temp.push(brand.brandname);
      brandOptions.push({"value":brand.brandname,"label":brand.brandname})
    }
    this.setState({filter:{
      ...this.state.filter,
      ["brandname"]:temp
      }
    });
  }
  getAll=async(event)=>{
    const response = await fetch('/api/getAll/');
    const resJSON = await response.json();
    resJSON.sort((a,b)=>a.price-b.price);
    let resDict={};
    //get favorited state from neo4j and set dict here
    for(let clothing of resJSON){
      resDict[clothing.imageurl]=clothing;
      resDict[clothing.imageurl].favorite=false;        //neo4j return val for current clothing;
    }
    const response2 = await fetch('/api/getFavorites/'+this.props.curUser);
    const resJSON2 = await response2.json();
    for(let record of resJSON2.records){
      resDict[record._fields[0]].favorite=true; //set imageurl fav to be true
    }
    this.setState({favorites:resDict});
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
  filterChange=(options,filterType,filterOptions,valueState)=>{
    this.setState({[valueState]:options});
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
  handleFav=async(event,imageurl)=>{
    //add/remove fav in neo4j database here...
    let temp = this.state.favorites;
    temp[imageurl].favorite=!temp[imageurl].favorite
    this.setState({favorites:temp});
    if(temp[imageurl].favorite){//add favorite relation to database
      const response = await fetch('/api/addFavorite/'+this.props.curUser+"/"+encodeURIComponent(imageurl));
      const resJSON = await response.json();
    }
    else{ //remove favorite from database
      const response = await fetch('/api/removeFavorite/'+this.props.curUser+"/"+encodeURIComponent(imageurl));
      const resJSON = await response.json();
    }
  }
  similarItems=async(event,price,color,type,gender)=>{
    event.preventDefault();
    const response = await fetch('/api/similar/'+price+"/"+color+"/"+type+"/"+gender);
    const resJSON = await response.json();
    this.setState({all:resJSON});
  }
  clearFilters(){
    this.setState({typeOption:null,actualOption:null,priceOption:null,genderOption:null,brandOption:null,all:allClothes,filter:{}});
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
          value={this.state.typeOption}
          options={typeOptions}
          isMulti
          onChange={event=>this.filterChange(event,"type",typeOptions,"typeOption")}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Colors</strong>
          <Select
          value={this.state.actualOption}
          options={colorOptions}
          isMulti
          onChange={event=>this.filterChange(event,"actual",colorOptions,"actualOption")}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Price</strong>
          <Select
          value={this.state.priceOption}
          options={priceOptions}
          isMulti
          onChange={event=>this.filterChange(event,"price",priceOptions,"priceOption")}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Brand</strong>
          <Select
          value={this.state.brandOption}
          options={brandOptions}
          isMulti
          onChange={event=>this.filterChange(event,"brandname",brandOptions,"brandOption")}
          closeMenuOnSelect={false}
          />
        </div>
        <div>
          <strong>Gender</strong>
          <Select
          value={this.state.genderOption}
          options={genderOptions}
          isMulti
          onChange={event=>this.filterChange(event,"gender",genderOptions,"genderOption")}
          closeMenuOnSelect={false}
          />
        </div>
        <Button onClick={this.clearFilters}>Reset Filters</Button>
        </div>
        <div id="browseCards">
        {this.state.all.map((result)=>{
        if(result==="None")return <h1 style={{textAlign:"center"}}>No Results Found</h1>
        else{
        return <Card style={{ width: '23rem',height:'100%'}}>
        <a target="_blank" rel="noopener noreferrer" href={result.websiteurl}><Card.Img variant="top" src={result.imageurl} /></a>
        <Card.Body>
          <Card.Title><a target="_blank" rel="noopener noreferrer" href={result.websiteurl}>{result.name}</a>
            {this.state.favorites[result.imageurl].favorite?<div><span onClick={event=>this.handleFav(event,result.imageurl)} style={{color: 'pink'}}>
              <MdFavorite size={20}/></span><Button className="similar" size="sm" onClick={event=>this.similarItems(event,result.price,result.actual,result.type,result.gender)}>See Similar</Button>
            </div>:<div><span onClick={event=>this.handleFav(event,result.imageurl)}>
              <MdFavoriteBorder size={20}/></span><Button className="similar" size="sm" onClick={event=>this.similarItems(event,result.price,result.actual,result.type,result.gender)}>See Similar</Button>
            </div>}
          </Card.Title>
          <Card.Text>
          <strong>{"$" + result.price+"\n"}</strong>
          {"Color: "+result.color+"\n"}
          {"Sold by: "+result.brandname+"\n"}
          {result.type+"\n"}
          {result.gender+"\n"}
          {/* "favorite:"+this.state.favorites[result.imageurl].favorite */}
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
      <div className="App" id="browse">
        {this.showAll()}
      </div>
    )
  }
}
export default Browse
