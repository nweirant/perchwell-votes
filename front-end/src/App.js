import "./App.css";
import { useState, useEffect } from "react";

function App() {
  const [clients, setClients] = useState([]);

  useEffect(() => {
    fetch("/clients")
    .then((res) => res.json())
    .then(
      (result) => {
        setClients(result);
      },
      (error) => {
        console.log(error);
      }
    );
  }, []);

  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>Client</th>
            <th>Num Requests</th>
          </tr>
        </thead>
        <tbody>
        {clients.map((client) => {
          return(
            <Client
              key={client.client_id}
              clientId={client.client_id}
              clientName={client.client_name}
              voteCount={client.vote_count}
            />
          )
        })}
        </tbody>
      </table>
    </div>
  );
}

function Client({clientId, clientName, voteCount}) {
  const [votes, setVotes] = useState(voteCount);

  function increment(e, client_id) {
    e.preventDefault();
    fetch(`/votes/${client_id}`, { method: 'POST' })
    .then((res) => res.json())
    .then(
      (result) => {
        setVotes(result.vote_count)
      },
      (error) => {
        console.log(error);
      }
    )
  }

  return (
  <tr key={clientId}>
    <td> {clientName} </td>
    <td> {votes} </td>
    <td><button onClick={(e) => increment(e, clientId)}>Increment</button></td>
  </tr>
  )
}

export default App;
