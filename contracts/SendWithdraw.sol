// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SendWithdraw {
    uint public payBalance;
    uint public test = 32;

    function getPayAmount() public payable {
        payBalance += msg.value;
        test += msg.value;
    }   

    function getWithdrawAmount() public view returns (uint256) {
        return  address(this).balance;
    }

    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getWithdrawAmount());
    }

    function payToSpecificAddr(address payable to) public {
        to.transfer(getWithdrawAmount());
    }
}