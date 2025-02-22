#!/usr/bin/env bash

# apply patches prior to chromium build. note: this increases likelyhood of build failures.
# echo "applying vanadium patches"
# vanadium_dir="${ROOT_DIR}/vanadium"
# git clone https://github.com/GrapheneOS/Vanadium.git "${vanadium_dir}"
# cd "${CHROMIUM_BUILD_DIR}/src"
# git am --whitespace=nowarn ${vanadium_dir}/patches/*.patch

if [ "${APPLY_BROMITE_PATCHES}" == "true" ]; then
    cd "${CHROMIUM_BUILD_DIR}/src"
    rm -rf .git/rebase-apply/
    echo "applying bromite patches"
    # Apply the patches in the given order
    while IFS= read -r line; do git am --whitespace=nowarn "${BROMITE_DIR}/build/patches/$line"; done < "${BROMITE_DIR}/build/bromite_patches_list.txt"
    # Apply component-update BUILD.gn patch
    echo "Applying component-update BUILD.gn patch"
    git apply --whitespace=nowarn "${CUSTOM_DIR}"/fix-bromite-component-updater-deps.patch
fi
