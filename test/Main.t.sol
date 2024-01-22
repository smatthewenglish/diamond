// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Main} from "../src/Main.sol";
import {SpecialVarManager} from "../src/Main.sol";
import {NotSpecialVarManager} from "../src/Main.sol";

// forge test --match-path ./test/Main.t.sol -vv
contract MainTest is Test {
    Main public main;
    SpecialVarManager public specialVarManager;
    NotSpecialVarManager public notSpecialVarManager;

    function setUp() public {
        main = new Main();
        specialVarManager = new SpecialVarManager();
        notSpecialVarManager = new NotSpecialVarManager();
    }

    function test_000() public {
        
        main.setVerySpecialVar(address(specialVarManager));
        console.log(" verySpecialVar: %s", main.verySpecialVar());

        main.setNotSoSpecialVar(address(notSpecialVarManager));
        console.log("notSoSpecialVar: %s", main.notSoSpecialVar());

    }

}
