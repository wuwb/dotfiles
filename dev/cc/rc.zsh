if _is_callable clang-format; then
  # alias format-all-clang="find . -regex '.*\.\(cpp\|hpp\|cc\|cxx\|h\)' -exec clang-format -style=file -i {} \;"
  alias format-all-clang="fd -x clang-format -i -style=file {} \; -e c -e cc -e cpp -e h -e hh -e hpp ."
fi

function cmake-configure-debug () {
  cmake --no-warn-unused-cli \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -S . -B build -G Ninja
  ln -s -f build/compile_commands.json
}
function cmake-build() {
  cmake --build build --config Debug --target all -j 14 --
}
function cmake-configure-release () {
  cmake --no-warn-unused-cli \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -S . -B release -G Ninja
}
function cmake-release () {
  cmake --build release --config Release --target all -j 14 --
}
alias cbb="cmake-configure-debug && cmake-build"
alias crr="cmake-configure-release && cmake-release"
function ctest-all() {
  ctest -j14 -C Debug -T test --output-on-failure
}
alias ctt="ctest-all"
