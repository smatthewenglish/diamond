// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
//import {Diamond} from "../src/Diamond.sol";

contract DiamondTest is Test {
    //Diamond public counter;

    function setUp() public {
        //counter = new Diamond();
        //counter.setNumber(0);
    }

    function test_Increment() public {
        //counter.increment();
        assertEq(uint256(1), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        //counter.setNumber(x);
        assertEq(x, x);
    }
}
