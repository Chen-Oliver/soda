import React, { Component } from 'react'
import {} from 'react-bootstrap';
import './About.css'
import steven from './ig_suit.PNG';

class About extends Component{
  constructor(props){
    super(props);
    this.state={
    }
  }
  render(){
    return(
      <div className="about">
      <h3 className="header">Our mission</h3>
        <p className="text">
          We are The GoodBois. A team of fashion (and code) enthusiasts, and our mission is to help make the community a more stylish place to be.
          We understand that fashion may not be a priority for you; however, you can still look great with the help of SODA!
          There are so many ways to put together clean and stylish outfits -- why not let artificial intelligence put it together for you
          so that you can have an abundance of thoughtless, cool outfit ideas? 😉
        </p>
        <br/>
        <h3>About us</h3>
          <p className="text">
          Our names are Oliver, Allen, Darren, and Steven. We are all third-year students at the University of Illinois at Urbana Champaign
          majoring in either Computer Science or Computer Engineering.
          </p>
          <div id="members">
            <h4>Oliver Chen</h4>
            <div>
              {/* <img className="picture" src="https://scontent.xx.fbcdn.net/v/t1.15752-0/p280x280/78352782_1160999787623629_2952790840633720832_n.jpg?_nc_cat=100&_nc_ohc=fSQHgpx6DYoAQl0Yv-9s0I3CBMxWt0zt1S7wBk3OKS6QrQEzcWTXlz_Jg&_nc_ad=z-m&_nc_cid=0&_nc_zor=9&_nc_ht=scontent.xx&oh=74da142ad9b3400250646f43f12af0b3&oe=5E3EE9A1"></img> */}
              <img className="picture" src="https://image.insider.com/5dd2cac879d757330b3ab572?width=600&format=jpeg&auto=webp"></img>
              &nbsp;&nbsp; I am the goat. 🐐
            </div>
            <br/>

            <h4>Darren Anco</h4>
            <div>
              <img className="picture" src="https://media.licdn.com/dms/image/C5603AQERJXXmcHErHQ/profile-displayphoto-shrink_800_800/0?e=1580947200&v=beta&t=ukNnR8OYZIj-jym00OmHcmIMbZa5SMtMRhhdJJZCb6w"></img>
              &nbsp;&nbsp; I am too cool for skool. 😎
            </div>
            <br/>

            <h4>Allen Chen</h4>
            <div>
              {/* <img className="picture" src="https://media.licdn.com/dms/image/C4D03AQGtMWRvQonPaQ/profile-displayphoto-shrink_800_800/0?e=1580947200&v=beta&t=PpcHptO8nqtbHmRYos3DKR708j6gFp_JY_MPe7Xtp34"></img> */}
              <img className="picture" src="https://scontent.xx.fbcdn.net/v/t1.15752-0/p280x280/78823558_443876536536579_3585392987363868672_n.jpg?_nc_cat=109&_nc_ohc=fOI1UPbEFqQAQkkQ-1njEc4j_tmgHautOZ4s-Mv86zpdfwhijuiH_lu4Q&_nc_ad=z-m&_nc_cid=0&_nc_zor=9&_nc_ht=scontent.xx&oh=21d7aaf67902a60a804862782e8905e7&oe=5E6F6F70"></img>
              &nbsp;&nbsp; I am mad handsome. 😙
            </div>
            <br/>

            <h4>Steven Lee</h4>
            <div>
              <img className="picture" src={steven} ></img>
              &nbsp;&nbsp; I am TheLegend27. 🤫
            </div>
            <br/>
          </div>
      </div>
    )
  }
}

export default About
