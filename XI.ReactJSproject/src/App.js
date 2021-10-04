import React from "react";
import Afis from './Afis';
import AddInfo from "./AddInfo";


class App extends React.Component {

state = {
    date: JSON.parse(localStorage.getItem("date"))
}

deleteData = (id) => {
    const date = this.state.date.filter(info => {
        return info.id !== id;
    });
    this.setState({
        date
    })
    localStorage.setItem("date", JSON.stringify(date));
}

afisElem = (info) => {
    info.id = Math.random();
    let date = [...this.state.date, info]
    this.setState({
        date
    })
    localStorage.setItem("date", JSON.stringify(date));
    
}


render() {
    return (<div>
        <h1>Agenda Telefonica</h1>
        <div className="App">
            
            <AddInfo afisElem={this.afisElem} />
            <h2>Date de contact :</h2>
            <Afis date={this.state.date} deleteData={this.deleteData}/>
            
           
        </div>
        </div>
    );
}

}

export default App;
