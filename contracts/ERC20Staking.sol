//SPDX-Lincense-Identifier: MIT
pragma solidity 0.8.23;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20Staking{

    address public owner;
    address public tokenAddress;


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



    constructor(address _tokenAddress){
        owner = msg.sender;
        tokenAddress = _tokenAddress;
    }



    function stakeToken(uint _duration) external{
        require(msg.sender != owner, "Address Zero can't stake");
        require(IERC20(tokenAddress).balanceOf(msg.sender) > 0,"Insufficient funds");

        uint stakingDuration = block.timestamp + (_duration * SECONDS_PER_MONTH);
        Users[msg.sender] = User(msg.sender, IERC20(tokenAddress).balanceOf(msg.sender) , stakingDuration);
        
        IERC20(tokenAddress).transferFrom(msg.sender, address(this), _amount);
        emit DepositSuccessful(msg.value);
    }


    function getgetMyEstimatedStakedBalance() public {
        
    }
    function withdrawStakes() external {

    }
}


