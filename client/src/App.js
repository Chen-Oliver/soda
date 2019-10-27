import React, { Component } from 'react'
import './App.css'
class App extends Component {
  state = {
    text: '',
    first: ''
  }
componentDidMount() {
    this.fetchGreeting();
  }
fetchGreeting = async () => {
    const response = await fetch('/api/greet');
    const resJSON= await response.json();
    this.setState({text:resJSON.text});
  }
fetchFirst = async()=>{
  const response = await fetch('/api/getFirst');
  const resJSON= await response.json();
  this.setState({first:"Type "+resJSON.type+ "\n Name: "+resJSON.name});
}
render() {
    return (
      <div className="App">
        <h3>{this.state.text}</h3>
        <button type='submit' onClick={this.fetchFirst}>Show First</button>
        <h3>{this.state.first}</h3>
      </div>
    )
  }
}
export default App
