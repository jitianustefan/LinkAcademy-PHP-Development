import React from 'react';

const Afis = ({date, deleteData}) => {
    
    
    const listadate = date.length ? (
        date.map(info => {
            return (
                <div className="Info-afis" key={info.id}>
                    <p>Nume: {info.nume}</p>
                    <p>Tel: {info.tel}</p>
                    <button onClick={() => {deleteData(info.id)}}>Delete</button>
                </div>
            )
        })
    ) : (
        <p>Nu sunt informatii inserate </p>
        );


    return (
        <div className="listaafis">
            {listadate}
        </div>
    );
}

export default Afis;