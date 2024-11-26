// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Profile.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ProfileFactory is Ownable, ReentrancyGuard {
    constructor() Ownable(msg.sender) {}

    // 1. Implement `createProfile` to allow users to create profiles with username validation and uniqueness checks.
    // 2. Add a fixed `profileCreationFee` to ensure users pay to create profiles.
    // 3. Emit a `ProfileCreated` event when a profile is successfully created.
    // 4. Implement `withdraw` for the owner to collect accumulated fees.
    // 5. Create `validateUsername` to enforce username rules (length and allowed characters).
    // 6. Allow retrieval of profiles by username with `getProfileByUsername`.
    // 7. Add pagination with `getProfilesPaginated` for efficient profile browsing.
}
