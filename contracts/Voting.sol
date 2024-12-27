// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Voting
/// @author 
/// @notice This contract allows creating proposals and conducting voting for them

contract Voting {
    struct Proposal {
        string name;
        uint voteCount;
    }

    address public owner;
    mapping(address => bool) public voters;
    Proposal[] public proposals;

    event Voted(address indexed voter, uint proposalId);

    /// @notice Contract constructor
    /// @param proposalNames Array of proposal names
    constructor(string[] memory proposalNames) {
        owner = msg.sender;
        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    /// @notice Function for voting on a proposal
    /// @param proposalId Proposal identifier
    function vote(uint proposalId) public {
        require(!voters[msg.sender], "You have already voted");
        require(proposalId < proposals.length, "Invalid proposal ID");
        
        voters[msg.sender] = true;
        proposals[proposalId].voteCount += 1;

        emit Voted(msg.sender, proposalId);
    }

    /// @notice Get the number of proposals
    /// @return Number of proposals
    function getProposalCount() public view returns (uint) {
        return proposals.length;
    }

    /// @notice Get proposal details
    /// @param proposalId Proposal identifier
    /// @return name Proposal name
    /// @return voteCount Number of votes
    function getProposal(uint proposalId) public view returns (string memory name, uint voteCount) {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage p = proposals[proposalId];
        return (p.name, p.voteCount);
    }
} 