# Token Swap Smart Contract

## Vision

The **Token Swap** smart contract provides a decentralized mechanism for users to create and accept token swap offers on the Aptos blockchain. This contract facilitates secure and transparent exchanges of tokens between users, ensuring both parties fulfill their agreed terms.

## Features

- **Create Swap Offer**:

  - Allows users to create swap offers, specifying the amount of tokens they are offering and the amount they expect in return.
  - The offer remains active until accepted or canceled.

- **Accept Swap Offer**:
  - Enables users to accept existing swap offers.
  - Handles the token transfers between the offer creator and the accepter.
  - Marks the offer as inactive once the swap is completed.

## Future Scope

1. **Offer Expiry**:

   - Implement expiry dates for swap offers to prevent stale offers from lingering.

2. **Offer Cancellation**:

   - Add functionality to allow offer creators to cancel their offers before they are accepted.

3. **Multiple Token Types**:

   - Support swapping between different types of tokens, not just AptosCoin.

4. **Swap Dispute Resolution**:

   - Introduce mechanisms for handling disputes or issues that arise during the swap process.

5. **Swap History**:

   - Track and display the history of swap offers and transactions for transparency.

6. **Automated Swaps**:
   - Develop features for automated or scheduled swaps based on predefined conditions.

The **Token Swap** contract enhances the Aptos ecosystem by providing a flexible, decentralized solution for token exchanges, promoting trust and efficiency in peer-to-peer transactions.
