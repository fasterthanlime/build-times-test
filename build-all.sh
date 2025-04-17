#!/bin/bash -eux

for dir in facet_at_08 syn_at_1 syn_at_2; do
    cargo clean --manifest-path "$dir/Cargo.toml"
    cargo build --release --timings --manifest-path "$dir/Cargo.toml" "$@"
done
