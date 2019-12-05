import React, { Component } from 'react'
import {Route,Link,BrowserRouter as Router,Switch} from 'react-router-dom';
import {Navbar,Nav} from 'react-bootstrap'
import Random from './Random'
import Home from './Home'
import About from './About';
import Browse from './Browse';
import Favorites from './Favorites';
import NotFound from './NotFound';
import Profile from './Profile'
import Admin from './Admin'
import Recommendations from './Recommendations';
import './App.css';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      loggedIn:false,
      curUser:"World"
    }
    this.loginSuccess=this.loginSuccess.bind(this);
  }
  loginSuccess(username){
    this.setState({loggedIn:true});
    this.setState({curUser:username});
  }
  render() {
      return (
        <Router>
         <div>
         {this.state.loggedIn?<div><Navbar expand="lg" className="navbar-custom">
          <Navbar.Brand>
            <Link to="/"><em>SODA</em></Link>
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="mr-auto">
            <Link to="/">Home</Link>
            <Link to="/browse">Browse</Link>
            <Link to="/favorites">Favorites</Link>
            <Link to="/random">Random</Link>
            <Link to="/recommendations">Recommendations</Link>
            <Link to="/profile">Profile({this.state.curUser})</Link>
            {this.state.curUser==="admin"?<Link to="/admin">Admin Tools</Link>:null}
            <Link to="/about">About</Link>
          </Nav>
          </Navbar.Collapse>
         </Navbar>
         <Switch>
           <Route exact path='/' render={(props) => (<Home {...props} loginSuccess={this.loginSuccess} loggedIn={true} curUser={this.state.curUser} />)}></Route>
           <Route exact path='/browse' render={(props) => (<Browse {...props} curUser={this.state.curUser} />)}></Route>
           <Route exact path='/favorites' render={(props) => (<Favorites {...props} curUser={this.state.curUser} />)}></Route>
           <Route exact path='/random' component={Random}></Route>
           <Route exact path='/recommendations' component={Recommendations}></Route>
           <Route exact path='/profile' render={(props) => (<Profile {...props} curUser={this.state.curUser} />)}></Route>
           {this.state.curUser==="admin"?<Route exact path='/admin' component={Admin}></Route>:null}
           <Route exact path='/about' component={About}></Route>
           <Route component={NotFound}></Route>
         </Switch></div>:<div><Navbar bg="transparent">
          <Nav className="mr-auto">
            <Link to="/"></Link>
            <Link to="/about"></Link>
          </Nav>
         </Navbar>
         <Switch>
           <Route exact path='/' render={(props) => (<Home {...props} loginSuccess={this.loginSuccess}  loggedIn={this.state.loggedIn} curUser={this.state.curUser} />)}></Route>
           <Route exact path='/about' component={About}></Route>
           <Route component={NotFound}></Route>
         </Switch></div>}
         </div>
       </Router>
     );
    }
}
export default App
