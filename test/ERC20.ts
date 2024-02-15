import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import {expect} from "chai";
import {ethers} from "hardHat";

describe("ERC20", function (){
    async function deployERC20() {
        const [owner, otherAccount] = await ethers.getSigners();

        const ERC20 = await ethers.getContractFactory("ERC20");
        const erc20 = await ERC20.deploy();

        return {erc20, owner, otherAccount};
    }

    describe("Setting State", function () {
        it("Should be able to set name state", async function () {
          const { erc20 } = await loadFixture(deployERC20);
    
          const tx = await erc20.transfer(true);
        //   const transferred = await erc20.getName();
    
          expect (tx).to.equal(true); 
    
          // expect(await lock.unlockTime()).to.equal(unlockTime);
        });

})