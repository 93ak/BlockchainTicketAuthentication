// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ChainPass {

    struct Ticket {
        string id;
        string eventName;
        string date;
        string venue;
        string seat;
        address owner;
        bool valid;
    }

    mapping(string => Ticket) public tickets;

    event TicketMinted(string ticketId, address owner);
    event TicketTransferred(string ticketId, address newOwner);
    event TicketUsed(string ticketId);

    function mintTicket(
        string memory _id,
        string memory _event,
        string memory _date,
        string memory _venue,
        string memory _seat,
        address _owner
    ) public {

        require(tickets[_id].owner == address(0), "Ticket already exists");

        tickets[_id] = Ticket(
            _id,
            _event,
            _date,
            _venue,
            _seat,
            _owner,
            true
        );

        emit TicketMinted(_id, _owner);
    }

    function verifyTicket(string memory _id) public view returns (
        string memory eventName,
        string memory date,
        string memory venue,
        string memory seat,
        address owner,
        bool valid
    ) {

        Ticket memory t = tickets[_id];
        return (
            t.eventName,
            t.date,
            t.venue,
            t.seat,
            t.owner,
            t.valid
        );
    }

    function transferTicket(string memory _id, address newOwner) public {

        Ticket storage t = tickets[_id];

        require(msg.sender == t.owner, "Not ticket owner");

        t.owner = newOwner;

        emit TicketTransferred(_id, newOwner);
    }

    function useTicket(string memory _id) public {

        Ticket storage t = tickets[_id];

        require(t.valid == true, "Ticket already used");

        t.valid = false;

        emit TicketUsed(_id);
    }
}