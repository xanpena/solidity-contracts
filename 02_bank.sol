// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

contract Bank {

    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
    }

    function Bank() payable public {
        owner = msg.sender;
    }

    function getBalance() view public returns(uint256) {
        return address(this).balance;
    }

    function getOwner() view public returns(address) {
        return owner;
    }

    function incrementBalance(uint256 amount) payable public {
        require(msg.value == amount);
    }

    function newOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }

    function withdrawBalance() public onlyOwner {
        msg.sender.transfer(address(this).balance);
    }
}
