// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Wallet1 {

    PaymentRecived public payment;
 
    function payContract() public payable {
        payment = new PaymentRecived(msg.sender, msg.value);
    }

}

contract PaymentRecived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet2 {
    struct PaymentRecievedStruct {
        address from;
        uint amount;
    }

    PaymentRecievedStruct public payment;

    function paymentContract() public payable {
        payment = PaymentRecievedStruct(msg.sender, msg.value);
    }
}