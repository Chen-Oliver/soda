import React, { Component } from 'react'
import './App.css'
class App extends Component {
  state = {
    text: '',
    random: ''
  }
componentDidMount() {
    this.fetchGreeting();
  }
fetchGreeting = async () => {
    const response = await fetch('/api/greet');
    const resJSON= await response.json();
    this.setState({text:resJSON.text});
  }
fetchRandom = async()=>{
  const response = await fetch('/api/getFirst');
  const resJSON= await response.json();
  this.setState({random:"\n Type "+resJSON.type+ "\n Name: "+resJSON.name});
}
handleSubmit(event) {
    event.preventDefault();
    const insertInputs =event.target.getElementsByClassName("insert");
    console.log("name:"+insertInputs.name.value);
    console.log("type:"+insertInputs.type.value);
    console.log("gender:"+insertInputs.gender.value);
    console.log("price:"+insertInputs.price.value);
    console.log("WebsiteURL:"+insertInputs.websiteURL.value);
    console.log("BrandName:"+insertInputs.BrandName.value);
    document.getElementById("insertForm").reset();
  }
render() {
    return (
      <div className="App">
        <h3>{this.state.text}</h3>
        <button type='submit' onClick={this.fetchRandom}>Show Random</button>
        <h3>{this.state.random}</h3>
        <form id="insertForm" onSubmit={this.handleSubmit}>
          <label>
            Name:
            <input className="insert" type="text" name="name" required/>
          </label>
          <label>
            Type:
            <input className="insert" type="text" name="type" required/>
          </label>
          <label>
          Gender:
          <select name="gender" className="insert" defaultValue="Male" onChange={this.handleChange}>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
          </select>
        </label>
        <label>
          Price:
          <input className="insert" type="number" step="0.01" name="price" required/>
        </label>
        <label>
          Website URL:
          <input className="insert" type="url" name="websiteURL" placeholder="https://example.com"
                  pattern="https://.*"
                  required/>
        </label>
        <label>
          Brand Name:
          <input className="insert" type="text" name="BrandName" required/>
        </label>
          <input type="submit" value="Insert Clothing" />
        </form>
      </div>
    )
  }
}
export default App
