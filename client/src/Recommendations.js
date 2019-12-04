import React, { Component } from 'react';
import {} from 'react-bootstrap';
import './Recommendations.css';


class Recommendations extends Component{
    constructor(props) {
        super(props);
        this.state={
            outfit:'',
            season:'',
            selectValue:""
        };
        this.onChange = this.onChange.bind(this);
    }

  generateFit = async(event)=>{
    let call = '/api/knn/' + this.state.selectValue;
    // call = '/api/getAll/'
    console.log(call)

    const response = await fetch(call);
    console.log(response)
    const resJSON= await response.json();
    console.log("resJSON")

    var input = [
        [
            "https://lp2.hm.com/hmgoepprod?set=source[/f5/f8/f5f8c4ba1e22488ac690d08cd1a26101750d55d7.jpg],origin[dam],category[men_jacketscoats_bikerjackets],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]",
            "https://lp2.hm.com/hmgoepprod?set=source[/fb/57/fb57adde72d8cb371a5e0e71cfa1d623ea4ec382.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[x],hmver[1]&call=url[file:/product/fullscreen]",
            "https://bananarepublic.gap.com/webcontent/0014/364/728/cn14364728.jpg"
        ],
        [
            "https://cdn.shopify.com/s/files/1/0007/0051/4360/products/WOAJW-H02475_PIA_00_1000x.jpg?v=1571712236",
            "https://www.jcrew.com/s7-img-facade/AE579_WX0774?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850",
            "https://cdn.shopify.com/s/files/1/0007/0051/4360/products/pxbls-h54156_lzz_00_1000x.jpg?v=1571712169"
        ],
        [
            "https://www.jcrew.com/s7-img-facade/B1552_GR7173?fmt=jpeg&qlt=90,0&resMode=sharp&op_usm=.1,0,0,0&crop=0,0,0,0&wid=850&hei=850",
            "https://bananarepublic.gap.com/webcontent/0017/583/834/cn17583834.jpg",
            "https://lp2.hm.com/hmgoepprod?set=source[/ec/79/ec7968e4ec4a868b084ea247deb17b25a23e2fc9.jpg],origin[dam],category[men_shoes_boots],type[DESCRIPTIVESTILLLIFE],res[s],hmver[2]&call=url[file:/product/main]"
        ]
    ];

    var output = resJSON.map( function( row, i ) {
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
                <option value="" disabled={this.selectValue!==""}></option>
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
