// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;


contract EtherStaking{
    address public owner;

    struct User{
        address userAddress;
        uint balance;
        uint duration;
    }

  


    mapping (address => User) Users;

    event DepositSuccessful( );
    event WithdrawalSuccessful();

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only address 0 can call this function");
        _;
    }


function stakeEther(uint _duration) external payable{
    
}

function getMyStakeBalance() external {
  

}

function withdrawStakedEther() external {
   
     




}
 function getStakedBalance() external view onlyOwner returns(uint){
    return address(this).balance;
 }
    
}