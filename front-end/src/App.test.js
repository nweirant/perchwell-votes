import { render, screen, act } from '@testing-library/react';
import App from './App';
import fetchMock from "fetch-mock-jest";
import userEvent from '@testing-library/user-event';


describe("App", () => {
  it('will fetch and render all clients', async () => {
    const clients = [
      {
          "client_id": 1,
          "client_name": "James",
          "vote_count": 0
      },
      {
          "client_id": 2,
          "client_name": "Eddie",
          "vote_count": 5
      },
      {
          "client_id": 3,
          "client_name": "Randy",
          "vote_count": 10
      }
    ]
    fetchMock.get("/clients", clients)

    // eslint-disable-next-line testing-library/no-unnecessary-act
    await act(async() => {
      render(<App />)
    })

    expect(fetchMock).toHaveLastFetched("/clients", "get")

    expect(screen.getByText(/James/i)).toBeInTheDocument();
    expect(screen.getByText(0)).toBeInTheDocument();

    expect(screen.getByText(/Eddie/i)).toBeInTheDocument();
    expect(screen.getByText(5)).toBeInTheDocument();

    expect(screen.getByText(/Randy/i)).toBeInTheDocument();
    expect(screen.getByText(10)).toBeInTheDocument();
    expect(screen.getAllByText(/Increment/i)).toHaveLength(3)

    expect(screen.getByText(/Client/i)).toBeInTheDocument();
    expect(screen.getByText(/Num Requests/i)).toBeInTheDocument();

    fetchMock.mockReset();
  })


  it('will update client votes when incremented', async () => {
    const clients = [
      {
          "client_id": 1,
          "client_name": "James",
          "vote_count": 0
      }
    ]

    const clientVoteResponse = {
        "client_id": 1,
        "client_name": "James",
        "vote_count": 1
    }
    fetchMock.get("/clients", clients)
    fetchMock.post("/votes/1", clientVoteResponse)

    // eslint-disable-next-line testing-library/no-unnecessary-act
    await act(async() => {
      render(<App />)
    })

    expect(screen.getByText(/James/i)).toBeInTheDocument();
    expect(screen.getByText(0)).toBeInTheDocument();

    // eslint-disable-next-line testing-library/no-unnecessary-act
    await act(async() => {
      userEvent.click(screen.getByRole("button", {name: "Increment"}))
    })

    expect(screen.getByText(/Client/i)).toBeInTheDocument();
    expect(screen.getByText(/Num Requests/i)).toBeInTheDocument();

    expect(screen.getByText(/James/i)).toBeInTheDocument();
    expect(screen.getByText(1)).toBeInTheDocument();

    expect(fetchMock).toHaveFetched("/clients", "get")
    expect(fetchMock).toHaveFetched("/votes/1", "post")

    fetchMock.mockReset();
  })
})

