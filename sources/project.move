module MyModule::DigitalWill {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::option;

    /// Struct representing a digital will.
    struct Will has store, key {
        beneficiary: address,
        assets: u64,
        executed: bool,
    }

    /// Function to create a digital will with asset deposit.
    public fun create_will(owner: &signer, beneficiary: address, assets: u64) {
        let deposit = coin::withdraw<AptosCoin>(owner, assets); // Withdraw assets from owner's account
        coin::deposit<AptosCoin>(signer::address_of(owner), deposit); // Deposit into the owner's account managed by the contract

        let will = Will {
            beneficiary,
            assets,
            executed: false,
        };
        move_to(owner, will);
    }

    /// Function to execute the will and transfer assets to the beneficiary.
    public fun execute_will(executor: &signer, will_owner: address) acquires Will {
        let will = borrow_global_mut<Will>(will_owner);
        assert!(!will.executed, 1); // Ensure the will hasn't been executed already.

        // Transfer the assets to the beneficiary.
        let transfer = coin::withdraw<AptosCoin>(executor, will.assets); // Executor withdraws the amount
        coin::deposit<AptosCoin>(will.beneficiary, transfer); // Deposit assets to the beneficiary

        will.executed = true; // Mark the will as executed.
    }
}
