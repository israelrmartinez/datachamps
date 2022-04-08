

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
                    How might Skillet employee achieve up-to-date data analytics for KPIs so that they can make data-driven business decisions?
                    </p>
                </div>

                <div className="AboutContext">
                    <header>
                        <h2>Context</h2>
                        <h4>What aspects of the problem can you solve through an information solution?</h4>
                    </header>
                    <p className="SubText">
                    Skillet wants to have a  database information system that is best suited for their needs:
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

export default Home;