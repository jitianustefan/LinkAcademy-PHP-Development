import React from "react";

class AddInfo extends React.Component{
    state ={
        nume: '',
        tel: ''
    }

    handleChange = (e) => {
            this.setState({
                nume: e.target.value, 
            })
    }

    handleChangeCopy = (e) => {
        this.setState({
            tel: e.target.value, 
        })
}

    handleSubmit = (e) => {
        e.preventDefault();
        
        this.props.afisElem(this.state);
    }


    render () {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <label>Adaugati numele: </label>
                    <input type="text" onChange={this.handleChange}/><br/>
                    <label>Adaugati nr. telefon: </label>
                    <input type="text" onChange={this.handleChangeCopy}/><br/>
                    <input id="button-submit" type="submit" value="Save"></input>
                </form>
            </div>
        )
    }
}

export default AddInfo;