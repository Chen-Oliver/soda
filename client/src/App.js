import React, { Component } from 'react'
import './App.css'
class App extends Component {
  state = {
    text: ''
  }
componentDidMount() {
    this.fetchGreeting();
  }
fetchGreeting = async () => {
    const response = await fetch('/api/greet');
    const resJSON= await response.json();
    this.setState({text:resJSON.text});
  }
render() {
    return (
      <div className="App">
        <h3>{this.state.text}</h3>
      </div>
    )
  }
}
export default App
