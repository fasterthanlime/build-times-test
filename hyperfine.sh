#!/usr/bin/env bash -eu

dirs=(facet_at_08 syn_at_2 syn_at_1)
cmds=()
for dir in "${dirs[@]}"; do
    cmds+=("cargo build --release --timings --manifest-path $dir/Cargo.toml $@")
done
hyperfine --warmup 3 --prepare "rm -rf "**/target"" "${cmds[@]}"
