import {
    Card, CardImg, CardText, CardBody,
    CardTitle, CardSubtitle, Button
} from 'reactstrap';
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

export default About;


