import React, { Component } from 'react';
import {} from 'react-bootstrap';
import './Recommendations.css';

class Recommendations extends Component{
    constructor(props) {
        super(props);
        this.state={
            outfit:'',
            season:'',
            selectValue:"spring"
        };
        this.onChange = this.onChange.bind(this);
    }

  generateFit = async(event)=>{
    let call = '/api/knn/' + this.state.selectValue;

    const response = await fetch(call);
    const resJSON= await response.json();
    // console.log(resJSON.replace(/'/g, '"'));
    let processedJson = JSON.parse(resJSON.replace(/'/g, '"'));
    // console.log(JSON.stringify(processedJson, null, 4))

    var output = processedJson.map( function( row, i ) {
        return row.map( function( cell, j ) {
            let img = (
                    <img
                    src={cell}
                    alt='new'
                    id='image'
                />
                );
            let test = (
                <div>
                    Outfit {i+1}
                </div>
            )
            if (j == 0){
                return [test, img];
            } else {
                return img
            }
        } );
    } )

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
        <button type='submit' onClick={this.generateFit}>Generate outfit</button>
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
        <h3>{this.state.outfit}</h3>
      </div>
    )
  }
}

export default Recommendations
