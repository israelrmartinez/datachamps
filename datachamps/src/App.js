import logo from './logo.svg';
import './App.css';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Routes,
} from "react-router-dom";
import { useState, useEffect, useRef } from 'react';

// import Home from'./Pages/Home';
// import About from'./Pages/About';
import {
  Card, CardImg, CardText, CardBody,
  CardTitle, CardSubtitle, Button
} from 'reactstrap';
import Header from './Components/Header/Header';
import React from "react";
import { slide as Menu} from "react-burger-menu";
// import aos from 'aos';
// import 'aos/dist/aos.cjs'
// aos.init()

function App() {
  document.addEventListener('aos:in', ({ detail }) => {
    console.log('animated in', detail);
  });
  
  document.addEventListener('aos:out', ({ detail }) => {
    console.log('animated out', detail);
  });
  
  return (
    <Router>
      <Header/>
      <SponsorInfo />
      {/* <div data-aos="fade-in"> */}
      <ProblemStatement />
      {/* </div> */}
      <Solution />
      <Audience />
      <S3 />
      <Sql />
      <Tableau />
      <About/>
    </Router>
  );
}

function FadeInSection(props) {
  const [isVisible, setVisible] = React.useState(false);
  const domRef = React.useRef();
  React.useEffect(() => {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => setVisible(entry.isIntersecting));
    });
    observer.observe(domRef.current);
  }, []);
  return (
    <div
      className={`fade-in-section ${isVisible ? 'is-visible' : ''}`}
      ref={domRef}
    >
      {props.children}
    </div>
  );
}

const SponsorInfo = () => {
  return (
      <div className="container">
        <header>
            <h2 className="about-heading">Our sponsor</h2>
        </header>
        <p className="SubText">
        We are sponsored by Skillet Restaurant Group, a local business that currently has four restaurant locations in Seattle and growing. They offer dine-in and take-out services and specialize in American fare.
        </p>
        <p className="SubText">
        “In short, Skillet is a modern diner, born on the streets of Seattle in a vintage Airstream kitchen, famous for its all-day brunch menu delivering elevated street food to Seattle world travelers.”
        </p>
      </div>
  )
}

const ProblemStatement = () => {
  return (
      <div className="container">
        <header>
            <h2 className="about-heading">Problem Statement</h2>
        </header>
        <p className="SubText">
        How might Skillet employee achieve up-to-date data analytics for KPIs so that they can make data-driven business decisions?
        </p>
        <header>
          <h2 className="about-heading">Problem</h2>
          <p className="SubText">
          Skillet relies on a manual data import system that requires long time to upload and analyze, while also leaving the room for human error. Skillet does not get accurate analytics report on their daily orders, revenue and costs or labor.
          </p>
        </header>
      </div>
  )
}

const Solution = () => {
  return (
      <div className="container">
        <header>
            <h2 className="about-heading">Solution</h2>
        </header>
        <p className="SubText">
        We are introducing Skillet Management Information System - a database that stores organizational data in a single space that is organized to create efficient, insightful analytics of most up-to-date data. Additionally, we are using Tableau to create Analytics Dashboard that automatically updates with data from database (live connection) to visualize most up-to-date KPI metrics.
        </p>
      </div>

  )
}

const Audience = () => {
  return (
      <div className="container">
        <header>
          <h2 className="about-heading">Audience</h2>
          <p className="SubText">
          Our intended audience is all employees who interacts with data at Skillet, which includes Leadership, Operations and IT. Leadership uses data to understand whether the business as a whole is staying on track with its goals, Operations use analytics to better understand KPIs such as revenue, labor cost and more. IT Team will be the staff we will handoff our project to so they will be responsible for maintenance and troubleshooting.
          </p>
        </header>
        {/* <header>
          <h2>Problem</h2>
          <p className="SubText">
          How might "Taco Bar" employees achieve up-to-date data analytics for KPIs so that they can make data-driven business decisions?
          </p>
        </header> */}
      </div>

  )
}

const S3 = () => {
  return (
      <div className="container">
        <header>
          <h2 className="about-heading">Amazon S3</h2>
          <p className="SubText">
          With Skillet’s current usage of the Toast point-of-sale system, data is saved within the Amazon Web Services S3 storage cloud. By implementing the retrieval of data stored in AWS, we have exported these reports for Skillet to gain access to point of sale information and further gain precise business insights about how their restaurants are operating during Covid.
          </p>
        </header>
      </div>
  )
}

const Sql = () => {
  return (
      <div className="container">
        <header>
          <h2 className="about-heading">SQL Server</h2>
          <p className="SubText">
          Skillet serves hundreds of customers every week at their multiple locations and must consider multiple factors to run their restaurants. We have established a SQL server database for Skillet in order to help organize and consolidate information about their restaurant into this location. By importing the Toast reports into this SQL server, Skillet will be able to access these reports through a centralized database. By utilizing this system, Skillet will be able to expand upon this data archive to further capture data on a day-to-day basis.
          </p>
        </header>
      </div>
  )
}

const Tableau = () => {
  return (
      <div className="container">
        <header>
          <h2 className="about-heading">Tableau</h2>
          <p className="SubText">
          Data visualization is a powerful tool for communicating data insights to non-technical audiences. We used Tableau to create the Skillet analytics dashboard. We built business reports based on Skillet’s KPIs, which are unique to their company as a small, local group of restaurants operating during Covid. The Live Connection feature enables immediate access to data stored in the database to reflect real-time analytics for restaurant operations. Tableau is accessible to a business audience, and Skillet will be able to create additional visualizations as their business expands and they identify new KPIs to measure. 
          </p>
        </header>
      </div>
  )
}

const Home = ({
  setList,
  list
}) => {
  
  return (
      <div className="container">
          <section className="flex-item">
              <div className="AboutContext">
                  <header>
                      <h2>Problem Statement</h2>
                  </header>
                  <p className="SubText">
                  How might "Taco Bar" employees achieve up-to-date data analytics for KPIs so that they can make data-driven business decisions?
                  </p>
              </div>

              <div className="AboutContext">
                  <header>
                      <h2>Context</h2>
                      <h4>What aspects of the problem can you solve through an information solution?</h4>
                  </header>
                  <p className="SubText">
                  Taco Bar wants to have a database information system that is best suited for their needs:
                  <ul>
                      <li>Real-time data</li>
                      <li>Ability to construct an analytics report</li>
                  </ul>
                  The consequences of inaction would include inaccurate data, no access to well-visualized reports that will lead to inability to analyze business needs efficiently. In our project we aim to use our data knowledge to improve and enhance Skillet's database information system to help their business better understand the insights on costs, customers and suppliers.
                  </p>
              </div>

              <div className="AboutContext">
                  <header>
                      <h2>Information Problem</h2>
                      <h4>What aspects of the problem can you solve through an information solution?</h4>
                  </header>
                  <p className="SubText">
                  Decrease human error and time spent creating business reports
                  <ul>
                      <li>Automating processes of data collection</li>
                      <li>Creating views and establishing user permissions to protect data from direct manipulation</li>
                      <li>Data manipulation is scripted for routine reports</li>
                  </ul>
                  Have up to date data in reports
                  <ul>
                      <li>Configure regularly timed data extracts</li>
                      <li>Load and update data at regularly timed intervals</li>
                      <li>All data is updated at same timed intervals</li>
                  </ul>
                  </p>
              </div>
          </section>
          {/* <section id="guide">
              <GuideForm setList={setList} listData={list} />
              <FoodList setList={setList} listData={list} />
          </section> */}
      </div>

  )
}

function About() {
  const mystyle = {
      border: '1px white',
      margin: '1rem',
      float: 'center',
      'max-width': '210px'
  };
  return (
      <div class="about-container">
      <h2>Team</h2>
          <div class = "flex-container2">
          <Card>
          <CardImg className="about-images" img src="img/kateryna.jpg" alt="image of Kateryna" />
          <CardBody>
              <CardTitle className="team-name">Kateryna Tymofeieva</CardTitle>
              <CardText>PM, UX Designer</CardText>
              <CardText>Strengths: Teamwork, Curiousity, Leadership </CardText>
          </CardBody>
          </Card>
          <Card>
          <CardImg className="about-images" img src="img/anusha.jpg" alt="image of Anusha" />
          <CardBody>
              <CardTitle className="team-name">Anusha Nasrulai</CardTitle>
              <CardText>Researcher, Data Analyst</CardText>
              <CardText>Strengths: Perspective, Honesty, Creativity</CardText>
          </CardBody>
          </Card>
          <Card>
          <CardImg className="about-images" img src="img/israel.jpg" alt="image of Israel" />
          <CardBody>
              <CardTitle className="team-name">Israel Martinez</CardTitle>
              <CardText>Developer</CardText>
              <CardText>Strengths: Humility, Prudence, Kindness</CardText>
          </CardBody>
          </Card>
          <Card>
          <CardImg className="about-images" img src="img/ryan.jpg" alt="image of Ryan" />
          <CardBody>
              <CardTitle>Ryan Lee</CardTitle>
              <CardText>Developer</CardText>
              <CardText>Strengths: Fairness, Humor, Curiousity</CardText>
          </CardBody>
          </Card>
          </div>
      </div>
  );
}

export default App;
