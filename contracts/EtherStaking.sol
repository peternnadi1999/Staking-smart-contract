// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;


contract EtherStaking{
    address public owner;

    struct User{
        address userAddress;
        uint balance;
        uint duration;
    }

  
    uint constant SECONDS_PER_DAY = 24*60*60;
    uint constant SECONDS_PER_MONTH = 30 * SECONDS_PER_DAY;


    mapping (address => User) Users;

    event DepositSuccessful( uint indexed  amount);
    event WithdrawalSuccessful();

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only address 0 can call this function");
        _;
    }


function stakeEther(uint _duration) external payable{
    require(msg.sender != owner, "Address Zero can't stake");
    require(msg.value > 0,"Insufficient funds");

    uint stakingDuration = block.timestamp + (_duration * SECONDS_PER_MONTH);
    Users[msg.sender] = User(msg.sender, msg.value, stakingDuration);
    emit DepositSuccessful(msg.value);
}


function depositStakingReward() external onlyOwner payable{
    require(msg.sender == owner, "only Address Zero can't stake");
    require(msg.value > 0,"Insufficient funds");
    emit DepositSuccessful(msg.value);
}

function getMyEstimatedStakedBalance() external view  returns (uint _balance, uint _duration){
    require(Users[msg.sender].balance > 0,"You did not stake any ether");
    uint starkingD = Users[msg.sender].duration - block.timestamp;
    uint fraction = 5;
    uint principle = Users[msg.sender].balance;
    uint totalDurationPerYear = 12 * SECONDS_PER_MONTH;
    uint time = (starkingD * 100) / totalDurationPerYear;

    uint interest  = (principle  * time * fraction) / (100* 100);
    uint currentAmount = interest + Users[msg.sender].balance;

    return (interest, currentAmount);
}

function withdrawStakedEther() external {
    require(Users[msg.sender].balance > 0,"You did not stake any ether");
    require(block.timestamp >= Users[msg.sender].duration ,"Staking time has not elapsed");
    uint starkingD = Users[msg.sender].duration - block.timestamp;
    uint fraction = 5;
    uint principle = Users[msg.sender].balance;
    uint totalDurationPerYear = 12 * SECONDS_PER_MONTH;
    uint time = (starkingD * 100) / totalDurationPerYear;

    uint interest  = (principle  * time * fraction) / (100 * 100);
    uint currentAmount = interest + Users[msg.sender].balance;
    (bool success,) = Users[msg.sender].userAddress.call{value: currentAmount}("");
    require (success, "Unable to withdraw");
    emit WithdrawalSuccessful();
}

 function getStakedBalance() external view onlyOwner returns(uint){
    return address(this).balance;
 }
    
}