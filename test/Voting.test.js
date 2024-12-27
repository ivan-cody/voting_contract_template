const { expect } = require("chai");

describe("Voting Contract", function () {
  let Voting, voting, owner, addr1, addr2;

  beforeEach(async function () {
    Voting = await ethers.getContractFactory("Voting");
    [owner, addr1, addr2, _] = await ethers.getSigners();
    voting = await Voting.deploy(["Proposal A", "Proposal B"]);
    await voting.deployed();
  });

  it("Should set the correct owner", async function () {
    expect(await voting.owner()).to.equal(owner.address);
  });

  it("Should allow voting for a proposal", async function () {
    await voting.connect(addr1).vote(0);
    const proposal = await voting.getProposal(0);
    expect(proposal.voteCount).to.equal(1);
  });

  it("Should not allow voting twice", async function () {
    await voting.connect(addr1).vote(0);
    await expect(voting.connect(addr1).vote(1)).to.be.revertedWith("You have already voted");
  });

  it("Should not allow voting for non-existent proposal", async function () {
    await expect(voting.connect(addr1).vote(5)).to.be.revertedWith("Invalid proposal ID");
  });
}); 