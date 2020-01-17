#!/usr/bin/env bats

@test "Check that the g++ is available" {
    command -v g++
}

@test "Check that the cmake is available" {
    command -v cmake
}

@test "Check that the git is available" {
    command -v git
}

@test "Check that the doxygen is available" {
    command -v doxygen
}