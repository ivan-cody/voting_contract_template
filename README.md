# Voting Smart Contract

A simple Ethereum smart contract for conducting voting on proposals. The contract allows creating multiple proposals and lets users vote on them, ensuring each address can only vote once.

## Features

- Create multiple proposals during contract deployment
- One vote per address
- View proposal details and vote counts
- Simple and gas-efficient implementation

## Prerequisites

- Node.js (v12 or higher)
- npm or yarn
- Hardhat

## Installation

1. Clone the repository
2. Install dependencies:
```bash
npm install
```

## Configuration

1. Create a `.env` file in the root directory
2. Add your environment variables:
```
PRIVATE_KEY=your_private_key
INFURA_PROJECT_ID=your_infura_project_id  # If deploying to testnet/mainnet
```

## Testing

Run the test suite:
```bash
npx hardhat test
```

## Deployment

1. To deploy to local Hardhat network:
```bash
npx hardhat run scripts/deploy.js
```

2. To deploy to a specific network (e.g., Goerli testnet):
```bash
npx hardhat run scripts/deploy.js --network goerli
```

## Contract Usage

1. The contract is deployed with an initial set of proposals
2. Users can vote for a proposal using the `vote(uint proposalId)` function
3. View proposal details using `getProposal(uint proposalId)`
4. Get the total number of proposals using `getProposalCount()`

## Contract Address

After deployment, the contract address will be displayed in the console. Save this address for future interactions.

## Security Considerations

- Each address can only vote once
- Invalid proposal IDs are rejected
- The contract uses OpenZeppelin's best practices

## License

MIT 