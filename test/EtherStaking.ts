import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre from "hardhat";

describe("EtherStaking", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployEtherStaking() {

    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.ethers.getSigners();

    const EtherStaking = await hre.ethers.getContractFactory("Lock");
    const etherStaking = await EtherStaking.deploy(owner);

    return { etherStaking, owner, otherAccount };
  }

  // describe("Deployment", function () {
    // it("Should set the right unlockTime", async function () {
    //   const { etherStaking } = await loadFixture(deployEtherStaking);

    //   expect(await lock.unlockTime()).to.equal(unlockTime);
    // });

  //   it("Should set the right owner", async function () {
  //     const { lock, owner } = await loadFixture(deployOneYearLockFixture);

  //     expect(await lock.owner()).to.equal(owner.address);
  //   });

  //   it("Should receive and store the funds to lock", async function () {
  //     const { lock, lockedAmount } = await loadFixture(
  //       deployOneYearLockFixture
  //     );

  //     expect(await hre.ethers.provider.getBalance(lock.target)).to.equal(
  //       lockedAmount
  //     );
  //   });

  //   it("Should fail if the unlockTime is not in the future", async function () {
  //     // We don't use the fixture here because we want a different deployment
  //     const latestTime = await time.latest();
  //     const Lock = await hre.ethers.getContractFactory("Lock");
  //     await expect(Lock.deploy(latestTime, { value: 1 })).to.be.revertedWith(
  //       "Unlock time should be in the future"
  //     );
  //   });
  // });

 
  
  });

