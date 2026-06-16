#!/usr/bin/env bats
# Unit tests for list/utility functions in OracleShellInstall.sh

setup() {
  load 'test_helper'
  setup_test_env
  source_functions
}

teardown() {
  teardown_test_env
}

#==============================================================#
#                   is_in_list tests                            #
#==============================================================#

@test "is_in_list: finds item in list" {
  run is_in_list "Red" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 0 ]
}

@test "is_in_list: finds item at end of list" {
  run is_in_list "ol" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 0 ]
}

@test "is_in_list: finds item in middle of list" {
  run is_in_list "rhel" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 0 ]
}

@test "is_in_list: returns 1 when item not in list" {
  run is_in_list "Ubuntu" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 1 ]
}

@test "is_in_list: is case sensitive" {
  run is_in_list "red" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 1 ]
}

@test "is_in_list: returns 1 for empty list" {
  run is_in_list "Red"
  [ "$status" -eq 1 ]
}

@test "is_in_list: handles single-element list (found)" {
  run is_in_list "CentOS" "CentOS"
  [ "$status" -eq 0 ]
}

@test "is_in_list: handles single-element list (not found)" {
  run is_in_list "Ubuntu" "CentOS"
  [ "$status" -eq 1 ]
}

@test "is_in_list: does not match partial strings" {
  run is_in_list "Cent" "Red" "CentOS" "rhel" "centos" "ol"
  [ "$status" -eq 1 ]
}

@test "is_in_list: works with numeric values" {
  run is_in_list "7" "6" "7" "8" "9"
  [ "$status" -eq 0 ]
}

@test "is_in_list: numeric value not in list" {
  run is_in_list "10" "6" "7" "8" "9"
  [ "$status" -eq 1 ]
}
