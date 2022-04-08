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
        <div>
        <h2>Team members</h2>
            <div class = "flex-container2">
            <div class="flex1">
            <Card style={mystyle}>
            <CardImg className="about-images" img src="img/kateryna.jpg" alt="image of Kateryna" />
            <CardBody>
                <CardTitle>Kateryna Tymofeieva</CardTitle>
                <CardText>PM, UX Designer</CardText>
                <CardText>Strengths: Teamwork, Curiousity, Leadership </CardText>
            </CardBody>
            </Card>
            </div>
            <div class="flex1">
            <Card style={mystyle}>
            <CardImg className="about-images" img src="img/anusha.jpg" alt="image of a man with a corndog" />
            <CardBody>
                <CardTitle>Anusha Nasrulai</CardTitle>
                <CardText>Researcher, Data Analyst</CardText>
                <CardText>Strengths: Perspective, Honesty, Creativity</CardText>
            </CardBody>
            </Card>
            </div>
            <div class="flex1">
            <Card style={mystyle}>
            <CardImg className="about-images" img src="img/israel.jpg" alt="image of woman with winged eyeliner" />
            <CardBody>
            <CardTitle>Israel Martinez</CardTitle>
                <CardText>Developer</CardText>
                <CardText>Strengths: Humility, Prudence, Kindness</CardText>
            </CardBody>
            </Card>
            </div>
            <div class="flex1">
            <Card style={mystyle}>
            <CardImg className="about-images" img src="img/ryan.jpg" alt="image of a man by a sunset" />
            <CardBody>
            <CardTitle>Ryan Lee</CardTitle>
                <CardText>Developer</CardText>
                <CardText>Strengths: Fairness, Humor, Curiousity</CardText>
            </CardBody>
            </Card>
            </div>
            </div>
        </div>
    );
}

export default About;


