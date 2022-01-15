// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Counter {

    uint256 counter; 

    constructor(uint256 _counter) {
        counter = _counter;
    }

    function getCounter() public view returns(uint256) {
        return counter;
    }

    function setCounter(uint256 _counter) public {
        counter = _counter;
    }

    function incrementCounter() public {
        counter += 1;
    }

    function getNumber() public pure returns(uint256) {
        return 35;
    }
}
