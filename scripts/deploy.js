const hre = require("hardhat");

async function main() {
  const Voting = await hre.ethers.getContractFactory("Voting");
  const proposals = ["Proposal 1", "Proposal 2", "Proposal 3"];
  const voting = await Voting.deploy(proposals);

  await voting.deployed();

  console.log("Voting Smart Contract deployed at address:", voting.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("Error deploying contract:", error);
    process.exit(1);
  }); 