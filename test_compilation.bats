#!/usr/bin/env bats
# Test: Vulkan Wallet Compilation

set -e

echo 'Testing Vulkan Wallet compilation...'

# Change to wallet directory
cd wallet

# Build in debug mode
cargo build

if [ $? -eq 0 ]; then
    echo 'Wallet compilation successful!'
    echo 'Binary: wallet/target/debug/vulkan_wallet'

    # Run tests
    echo 'Running tests...'
    cargo test

    if [ $? -eq 0 ]; then
        echo 'All wallet tests passed!'
    else
        echo 'Wallet tests failed!'
        exit 1
    fi
else
    echo 'Wallet compilation failed!'
    exit 1
fi