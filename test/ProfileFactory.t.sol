// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/ProfileFactory.sol";

contract ProfileFactoryTest is Test {
    ProfileFactory factory;

    function setUp() public {
        factory = new ProfileFactory();
    }

    function testDeployment() public view {
        require(address(factory) != address(0), "ProfileFactory contract should be deployed");
    }

    function testGetProfileByUsername() public {
        // Set up initial data
        string memory username = "testuser";
        string memory aboutMe = "Test about me";
        string[] memory socialProfiles = new string[](1);
        socialProfiles[0] = "https://twitter.com/testuser";

        // Fund the test contract to pay the profile creation fee
        uint256 profileFee = 0.0001 ether;
        vm.deal(address(this), profileFee);

        // Create a profile
        factory.createProfile{value: profileFee}(username, aboutMe, socialProfiles);

        // Get the profile address by username
        address profileAddress = factory.getProfileByUsername(username);

        // Verify that the returned profile address is not zero
        assert(profileAddress != address(0));

        // Verify that the profile contract exists at the returned address
        Profile profile = Profile(profileAddress);
        assertEq(profile.getProfileDetails().username, username, "Username does not match");
    }
}
