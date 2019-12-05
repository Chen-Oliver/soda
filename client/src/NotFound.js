import React, { Component } from 'react'
import { Button} from 'react-bootstrap';
class NotFound extends Component{
  render(){
    return <div className="App">
    <h3>404 Not Found!</h3>
    <Button onClick={()=>window.location='/'}>Go Back</Button>
    </div>
  }
}

export default NotFound
