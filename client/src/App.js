import React, { Component } from 'react'
import {Route,Link,BrowserRouter as Router,Switch} from 'react-router-dom';
import {Navbar,Nav} from 'react-bootstrap'
import Random from './Random'
import Home from './Home'
import About from './About';
import Browse from './Browse';
import NotFound from './NotFound';
import './App.css';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      loggedIn:false
    }
  }
  render() {
      return (
        <Router>
         <div>
         {this.state.loggedIn?<div><Navbar bg="light" variant="light">
          <Navbar.Brand><Link to="/">SODA</Link></Navbar.Brand>
          <Nav className="mr-auto">
            <Link to="/">Home</Link>
            <Link to="/browse">Browse</Link>
            <Link to="/random">Random</Link>
            <Link to="/about">About</Link>
          </Nav>
         </Navbar>
         <Switch>
           <Route exact path='/' component={Home}></Route>
           <Route exact path='/browse' component={Browse}></Route>
           <Route exact path='/random' component={Random}></Route>
           <Route exact path='/about' component={About}></Route>
           <Route component={NotFound}></Route>
         </Switch></div>:<div><Navbar bg="light" variant="light">
          <Navbar.Brand><Link to="/">SODA</Link></Navbar.Brand>
          <Nav className="mr-auto">
            <Link to="/">Home</Link>
            <Link to="/about">About</Link>
          </Nav>
         </Navbar>
         <Switch>
           <Route exact path='/' component={Home}></Route>
           <Route exact path='/about' component={About}></Route>
           <Route component={NotFound}></Route>
         </Switch></div>}
         </div>
       </Router>
     );
    }
}
export default App
