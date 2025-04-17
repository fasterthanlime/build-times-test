#!/usr/bin/env -S bash -eu

dirs=(facet_at_08 syn_at_2 syn_at_1)
names=("facet@0.8" "syn@2" "syn@1")
cmds=()
for i in "${!dirs[@]}"; do
    dir="${dirs[$i]}"
    name="${names[$i]}"
    cmds+=("--command-name" "$name" "cargo build --release --timings --manifest-path $dir/Cargo.toml $@")
done
hyperfine --warmup 3 --max-runs 10 --prepare "rm -rf "**/target"" "${cmds[@]}"
