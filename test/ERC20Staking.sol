// import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
// import { expect } from "chai";
// import  hre from "hardhat";

// describe("Lock", function () {
//   // We define a fixture to reuse the same setup in every test.
//   // We use loadFixture to run this setup once, snapshot that state,
//   // and reset Hardhat Network to that snapshot in every test.
//   async function deployEtherStaking() {

//     // Contracts are deployed using the first signer/account by default
//     const [owner, otherAccount] = await hre.ethers.getSigners();

//     const EtherStaking = await hre.ethers.getContractFactory("Lock");
//     const etherStaking = await EtherStaking.deploy(owner);

//     return { etherStaking, owner, otherAccount };
//   }
// });