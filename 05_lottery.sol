pragma solidity ^0.5.0;

contract Lottery {

    address internal owner;
    address public   player;
    uint256 internal num;
    uint256 public   winningNumber;
    uint256 public   price;
    bool    public   game;

    constructor(uint256 _winningNumber, uint256 _price) public payable {
        owner         = msg.sender;
        num           = 0;
        winningNumber = _winningNumber;
        price         = _price;
        game          = true;
    }

    function checkSuccess(uint256 _num) private view returns(bool) {
        if (_num == winningNumber) {
            return true;
        }
        return false;
    }

    function getAwardResult() public view returns(uint256) {
        return address(this).balance - (num * (price/2));
    }

    function play() external payable returns(bool result, uint256 playerNumber) {
        require(game == true);
        require(msg.value == price);

        uint256 randomNumber = randomNumber();

        if (checkSuccess(randomNumber)) {
            game = false;
            msg.sender.transfer(address(this).balance - (num * (price/2)));
        } else {
            num++;
            result       = false;
            playerNumber = randomNumber;
        }
    }

    function randomNumber() private view returns(uint256) {
        return uint256(keccak256(abi.encode(now, msg.sender, num))) % 10;
    }

    function withdrawFunds() external returns(uint256) {
        require(msg.sender == owner);
        require(game == false);
        msg.sender.transfer(address(this).balance);
        return address(this).balance;
    }
}
