// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Profile.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ProfileFactory is Ownable, ReentrancyGuard {
    constructor() Ownable(msg.sender) {}

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
