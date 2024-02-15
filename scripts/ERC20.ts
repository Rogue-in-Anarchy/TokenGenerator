import {ethers} from "hardHat";

async function main(){
    const ERC20 = await ethers.deployContract("ERC20");
    await ERC20.waitForDeployment;

    console.log(`ERC20 contract has been deployed to ${ERC20.target}`);
}

main().catch((error) => {
    console.error(error);;
    process.exitCode = 1;
})