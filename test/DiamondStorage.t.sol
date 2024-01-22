// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PseudoDiamond} from "../src/DiamondStorage.sol";
import {Facet1} from "../src/DiamondStorage.sol";
import {Facet2} from "../src/DiamondStorage.sol";

// forge test --match-path ./test/PseudoDiamond.t.sol -vv
contract PseudoDiamondTest is Test {
    PseudoDiamond public pseudoDiamond;
    Facet1 public facet1;
    Facet2 public facet2;
  
    function setUp() public {
        pseudoDiamond = new PseudoDiamond();    
        facet1 = new Facet1();    
        facet2 = new Facet2(); 
    }

    function test_000() public {
        
        pseudoDiamond.writeToSharedVar(address(facet1), 666);
        console.log("sharedVar: %s", pseudoDiamond.readSharedVar(address(facet2)));

    }

}
