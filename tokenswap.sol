//SPDX-License-Identifier: MIT

pragma ^0.8.13;

import  "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";

//Here is an example contract, TokenSwap, to trade one ERC20 token for another.

contract TokenSwap {
    IERC20 public token1;
    address public user1;
    uint public amount1;
    IERC20 public token2;
    address public user2;
    uint public amount2;
    
    constructor(
        IERC20 _token1,
        address _user1,
        uint _amount1,
        IERC20 _token2,
        address _user2,
        uint _amount2
    ){
    token1 = _token1;
     user1 = _user1;
     amount1 = _amount1;
     token2 = _token2;
     user2 = _user2;
     amount2 = _amount2;
    }

function swap() public {
 require(msg.sender == user1 || msg.sender == user2, "User not authorized");
 require((token1.allowance(user1,address(this)))>= amount1,"Token1 allowance too low");
 require((token2.allowance(user2,address(this)))>= amount2,"Token1 allowance too low");
safeTransfer(token1,user1,owner2,amount1);
safeTransfer(token2,owner2,owner1,amount2);

}

function safeTransfer(IERC20 token, address sender ,address recipient, uint amount) private{

    bool sent = token.transferFrom(sender, recipient, amount);
    require(sent,"Token transfer fail);

}
}