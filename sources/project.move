module MyModule::TokenSwap {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a swap offer.
    struct SwapOffer has store, key {
        offer_amount: u64,  // Amount of tokens offered by the first user
        expected_amount: u64,  // Amount of tokens expected in return
        is_active: bool,  // Whether the swap offer is active
    }

    /// Function to create a swap offer.
    public fun create_swap_offer(creator: &signer, offer_amount: u64, expected_amount: u64) {
        let offer = SwapOffer {
            offer_amount,
            expected_amount,
            is_active: true,
        };
        move_to(creator, offer);
    }

    /// Function for another user to accept the swap offer.
    public fun accept_swap_offer(accepter: &signer, offer_creator_address: address) acquires SwapOffer {
        let offer = borrow_global_mut<SwapOffer>(offer_creator_address);

        // Ensure the offer is still active
        assert!(offer.is_active, 1);

        // Transfer tokens from the accepter to the offer creator
        let payment = coin::withdraw<AptosCoin>(accepter, offer.expected_amount);
        coin::deposit<AptosCoin>(offer_creator_address, payment);

        // Transfer the offered tokens from the offer creator to the accepter
        let offered_tokens = coin::withdraw<AptosCoin>(accepter, offer.offer_amount);
        coin::deposit<AptosCoin>(signer::address_of(accepter), offered_tokens);

        // Mark the offer as inactive after the swap is completed
        offer.is_active = false;
    }
}
