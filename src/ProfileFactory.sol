// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Profile.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ProfileFactory is Ownable, ReentrancyGuard {
    event ProfileCreated(address indexed profileAddress, string username);

    Profile[] public profiles;
    mapping(string => address) public usernameToProfile;

    constructor() Ownable(msg.sender) {}

    function createProfile(string memory _username, string memory _aboutMe, string[] memory _socialProfiles)
        public
        payable
    {
        require(msg.value == 0.0001 ether, "Invalid Profile Fee");
        Profile profile = new Profile(_username, _aboutMe, _socialProfiles);
        profile.transferOwnership(msg.sender);
        profiles.push(profile);
        usernameToProfile[_username] = address(profile);
        emit ProfileCreated(address(profile), _username);
    }

    function withdraw() public onlyOwner nonReentrant {
        payable(owner()).transfer(address(this).balance);
    }

    function getProfileByUsername(string memory _username) public view returns(address) {
        return usernameToProfile[_username];
    }

    function getProfiles() public view returns (Profile[] memory) {
        return profiles;
    }

    // 1.📌 Implement `createProfile` to allow users to create profiles
    // - 📌: Make sure you transfer ownership to the wallet that initiated the createProfile transaction
    // - 📌: Emit a `ProfileCreated` event when a profile is successfully created.
    // - ⭐️: Add with username validation (special characters and length)

    // 2. 📌 Add a fixed `profileCreationFee` to ensure users pay to create profiles.
    // - ⭐️: Add different prices for  different length of username 3-5 most expensive, 6-10, 10-15....

    // 3. 📌 Implement `withdraw` for the owner to collect accumulated fees.
    //   - ⭐️ Allow for partial withdraws

    // 4. 📌 Allow retrieval of profiles by username with `getProfileByUsername`.
    //   - ⭐️ Use bytes32 instead of string for gas efficiency.

    // 5. 📌 Allow retrieval of a list of profiles.
    //   - ⭐️ Add pagination for efficient profile fetching.
}
