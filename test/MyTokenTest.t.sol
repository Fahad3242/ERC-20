// SPDX-License-Identifier: MIT
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

    function testMeBalance() public {
        // Check the balance of the "me" address
        assertEq(STARTING_BALANCE, myToken.balanceOf(me));
    }
 
    function testAllowanceWorks() public {
        uint256 initialAllowance = 1000 ether; 
        //me approves you to spend tokens on me's behalf
        vm.prank(me);
        myToken.approve(you, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(you);
        myToken.transferFrom(me, you, transferAmount);

        assertEq(myToken.balanceOf(you), transferAmount);
        assertEq(myToken.balanceOf(me), STARTING_BALANCE - transferAmount);
    }

    function testTransfer() public {
        uint256 transferAmount = 100 ether;

        vm.prank(me);
        myToken.transfer(you, transferAmount);

        assertEq(myToken.balanceOf(you), transferAmount);
        assertEq(myToken.balanceOf(me), STARTING_BALANCE - transferAmount);
}


    function testApproveAndAllowance() public {
        uint256 allowanceAmount = 200 ether;

        vm.prank(me);
        myToken.approve(you, allowanceAmount);

        uint256 allowance = myToken.allowance(me, you);
        assertEq(allowance, allowanceAmount);
}

    function testRevertTransferInsufficientBalance() public {
        uint256 transferAmount = STARTING_BALANCE + 1;

        vm.prank(me);
        vm.expectRevert();
        myToken.transfer(you, transferAmount);
}

    function testRevertTransferFromWithoutApproval() public {
        uint256 transferAmount = 50 ether;

        vm.prank(you);
        vm.expectRevert();
        myToken.transferFrom(me, you, transferAmount);
}


}
    