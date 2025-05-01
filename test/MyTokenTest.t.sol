//SPDX License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMyToken} from "../script/DeployMyToken.s.sol";
import {MyToken} from "../src/MyToken.sol"; 

contract MyTokenTest is Test {
    // State variables
    MyToken public myToken;
    DeployMyToken public deployer;

    address me = makeAddr("me");
    address you = makeAddr("you");
    address he = makeAddr("he");    
    address she = makeAddr("she");
    address they = makeAddr("they");

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        // This function is called before each test
        // You can set up any state or variables needed for the tests here
            deployer = new DeployMyToken();
            myToken = deployer.run();

            vm.prank(msg.sender);    
            myToken.transfer(me, STARTING_BALANCE);

    }

    function testmeBalance() public {
        // Check the balance of the "me" address
        assertEq(STARTING_BALANCE, myToken.balanceOf(me));
    }
}