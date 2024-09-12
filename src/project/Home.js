import React from "react";
import {useState,useEffect} from 'react';
import $ from 'jquery';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Alert from 'react-bootstrap/Alert';
import { CardGroup, InputGroup } from "react-bootstrap";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import { Carousel }  from 'react-bootstrap'; 
import Card from 'react-bootstrap/Card';
import love2 from './covers/love2.jpg';
import scifi1 from './covers/scifi1.jpg';
import fanatsy1 from './covers/fantasy1.jpg';
import action1 from './covers/action1.jpg';
import action2 from './covers/action2.jpg';
import adv1 from './covers/adv1.jpg';
import adv2 from './covers/adv2.jpg';
import adv3 from './covers/adv3.jpg';
import comic1 from './covers/comic1.jpg';
import comic2 from './covers/comic2.jpg';
import fanatsy2 from './covers/fantasy2.jpg';
import fanatsy3 from './covers/fantasy3.jpg';
import history1 from './covers/history1.jpg';
import history2 from './covers/history2.jpg';
import horror1 from './covers/horror1.jpg';
import horror2 from './covers/horror2.jpg';
import love1 from './covers/love1.jpg';
import rom1 from './covers/rom1.jpg';
import rom2 from './covers/rom2.jpg';
import scifi2 from './covers/scifi2.jpg';
import scifi3 from './covers/scifi3.jpg';
import thriller1 from './covers/thriller1.jpg';
import thriller2 from './covers/thriller2.jpg';
import thriller3 from './covers/thriller3.jpg';
import Image from 'react-bootstrap/Image';

function Home(){
    
	 const [users, setUsers] = useState([]);
	 const [books, setBooks] = useState([]);
	
	useEffect(() => {
		$.ajax({type:"POST",url:"http://localhost/backend/select.php",data:{datafor:"users"},success(data){
			var obj = JSON.parse(data);
			if(obj.length > 0){
				setUsers(obj);
			}
		}});
		
		$.ajax({type:"POST",url:"http://localhost/backend/select.php",data:{datafor:"books"},success(data){
			console.log(data);
			var obj = JSON.parse(data);
			if(obj.length > 0){
				setBooks(obj);
			}
		}});
		
	},[]);
	
	const renderUsers = () => {
		let userItems = [];
		const imgFold = require.context('./userpic',true);
		for(let i = 0; i < users.length; i++)
		userItems.push(<Container key={i} style={{borderRadius:"12px", maxWidth:"19rem", maxHeight:"6rem",background:"white",boxShadow:"0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",margin:"5px 5px 5px 5px"}}>
						<br/>
						<Container align="center">
						<Row>
						<Col>
						<Image style={{height:"80px",width:"80px",position:"relative",top:"-16px",left:"-12px"}} src={imgFold(`./${users[i].pfp}`)} roundedCircle />
						</Col>
						<Col>
						<b style={{position:"relative",top:"-14px",left:"-14px"}}>@{users[i].username}</b>
						<br/>
						<Button style={{backgroundColor:"#536493",borderColor:"#536493",fontSize:"10px",position:"relative",top:"-6px",left:"-12px"}}>Add Friend</Button>
						</Col>
						</Row>
						</Container>
						<br/>
		</Container>);
		return userItems;
	};
	
	const renderBooks = () => {
		let carouselItems = [];
		let currentSlide = [];
		const imgFold = require.context('./covers',true);
		for(let i = 0; i < books.length; i++){
			currentSlide.push(
				<Col key={i} style={{ borderRadius: "12px", maxWidth: "18rem", background: "white", boxShadow: "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)", margin: "5px 5px 5px 5px" }}>
				<Container>
				<Row>
				<Col md={5}>
                <Image style={{ height: "100px", width: "90px", margin: "3px" }} src={imgFold(`./${books[i].cover}`)} thumbnail />
				</Col>
				<Col md={7}>
                <b style={{fontSize:"10px",whiteSpace: "nowrap",overflow: "hidden",textOverflow: "ellipsis" }}>{books[i].title}</b>
				<br/>
				<br/>
				<Button style={{backgroundColor:"#EF5A6F",borderColor:"#EF5A6F",fontSize:"10px",position:"relative",bottom:"5px"}}>Read</Button>
				</Col>
				</Row>
				</Container>
				</Col>
			);
			if ((i + 1) % 3 === 0 || i === books.length - 1) {
				carouselItems.push(
					<Carousel.Item key={`slide-${i}`} interval={2500}>
						<Row>
						{currentSlide}
						</Row>
					</Carousel.Item>
					);
				currentSlide = [];
			}
		}
		
		return carouselItems;
	};
	
    return(
        <>
			<Container fluid style={{marginLeft:"0px",marginRight:"0px",backgroundColor:"#FFF1DB"}}>
			<Row>
			<Col md={9}  style={{borderRight:"2px dashed #d3d3d3"}}>
				<br/>
				<div align="center">
					<Container>
					<InputGroup size='lg'>
						<Form.Control placeholder="Enter book name that is fascinating you..." style={{fontSize:"12px"}}/>
						<Button style={{backgroundColor:"#536493",borderColor:"#536493",fontSize:"12px"}}>Search</Button>
					</InputGroup>
					</Container>
				</div>
				<br/>
				<Container style={{borderRadius:"25px 0px 0px 25px",background:"white",clipPath: "polygon(0 0, calc(100% - 150px) 0, 100% 50%, calc(100% - 150px) 100%, 0 100%, 0 50%)"}}>
				<Row>
				<Col md={5} style={{background:"#EF5A6F",borderRadius:"25px 150px 150px 25px", clipPath: "polygon(0 0, calc(100% - 150px) 0, 100% 50%, calc(100% - 150px) 100%, 0 100%, 0 50%)",position:"absolute",width:"28rem",height:"17.6rem",zIndex:"2"}}>
				<h2 style={{color:"#FFF1DB",position:"relative",top:"30px",fontFamily:"Impact, Charcoal, sans-serif",fontWeight:"400",fontStyle:"oblique",textDecoration:"none solid rgb(68, 68, 68)",textTransform:"uppercase",fontSize:"58px",border:"2px dashed #FFF1DB",padding:"60px 90px 90px 60px",width:"500px"}} align="center">Trending &#10097;&#10097;</h2>
				</Col>
				<Col md={7} >
				<div align="center" style={{position:"relative",left:"320px",zIndex:"1"}}>
					<Carousel style={{width:"80vh"}}>
						<Carousel.Item interval={2500}>
							<img style={{height:'50vh',width:'45vh'}} src={love2} alt="First slide"/>
						</Carousel.Item>
						<Carousel.Item interval={2500}>
							<img style={{height:'50vh',width:'45vh'}} src={scifi1} alt="Second slide"/>			  
						</Carousel.Item>  
						<Carousel.Item interval={2500}>
							<img style={{height:'50vh',width:'45vh'}} src={fanatsy1} alt="Third slide"/>
						</Carousel.Item> 
					</Carousel>
				</div>
				</Col>
				</Row>
				</Container>
				<br/>
				<br/>
				<br/>
				<div style={{borderRadius:"10px",border:"2px dashed #EF5A6F",zIndex:"1",backgroundColor:"white"}}>
				<h2 style={{maxWidth:"320px",borderRadius:"10px",backgroundColor:"#EF5A6F",color:"#FFF1DB",zIndex:"2",position:"relative",top:"-37px",left:"5%",fontFamily:"Impact, Charcoal, sans-serif",fontWeight:"400",fontStyle:"oblique",textDecoration:"none solid rgb(68, 68, 68)",textTransform:"uppercase",fontSize:"58px"}} align="center">Top Picks &#10097;&#10097;</h2>
				<Container>
					<Row>
					<Carousel align="center">
					{renderBooks()}
					</Carousel>
					</Row>
					<br/>
				</Container>
				</div>
				<br/>
				<br/>
				<br/>
				<div style={{borderRadius:"10px",border:"2px dashed #EF5A6F",zIndex:"1",backgroundColor:"white"}}>
				<h2 style={{maxWidth:"370px",borderRadius:"10px",backgroundColor:"#EF5A6F",color:"#FFF1DB",zIndex:"2",position:"relative",top:"-37px",left:"5%",fontFamily:"Impact, Charcoal, sans-serif",fontWeight:"400",fontStyle:"oblique",textDecoration:"none solid rgb(68, 68, 68)",textTransform:"uppercase",fontSize:"58px"}} align="center">Top Comics &#10097;&#10097;</h2>
				<Container>
					<Row>
					<Carousel align="center">
					{renderBooks()}
					</Carousel>
					</Row>
					<br/>
				</Container>
				</div>
			</Col>
			<Col md={3} style={{padding:"0px"}}>
			<h2 style={{margin:"0px 0px 0px 0px",backgroundColor:"#536493",color:"#FFF1DB",zIndex:"2",fontFamily:"Impact, Charcoal, sans-serif",fontWeight:"400",fontStyle:"oblique",textDecoration:"none solid rgb(68, 68, 68)",textTransform:"uppercase",fontSize:"32px"}} align="center">Suggested Friends</h2>
			<div id="sug-users" align="center">
			{renderUsers()}
			</div>
			</Col>
			</Row>
			</Container>
       </> 
    );
}

export default Home;
