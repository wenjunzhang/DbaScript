#!/usr/bin/env bats
# Unit tests for IP/network validation functions in OracleShellInstall.sh

setup() {
  load 'test_helper'
  setup_test_env
  source_functions
}

teardown() {
  teardown_test_env
}

#==============================================================#
#                     check_ip tests                            #
#==============================================================#

@test "check_ip: valid IP 192.168.1.1" {
  run check_ip "192.168.1.1"
  [ "$status" -eq 0 ]
}

@test "check_ip: valid IP 10.0.0.1" {
  run check_ip "10.0.0.1"
  [ "$status" -eq 0 ]
}

@test "check_ip: valid IP 255.255.255.255" {
  run check_ip "255.255.255.255"
  [ "$status" -eq 0 ]
}

@test "check_ip: valid IP 0.0.0.0" {
  run check_ip "0.0.0.0"
  [ "$status" -eq 0 ]
}

@test "check_ip: valid IP 172.16.0.100" {
  run check_ip "172.16.0.100"
  [ "$status" -eq 0 ]
}

@test "check_ip: rejects empty string" {
  run check_ip ""
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects hostname" {
  run check_ip "localhost"
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects IP with port" {
  run check_ip "192.168.1.1:8080"
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects incomplete IP (3 octets)" {
  run check_ip "192.168.1"
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects IP with 5 octets" {
  run check_ip "192.168.1.1.1"
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects IP with letters" {
  run check_ip "192.168.a.1"
  [ "$status" -eq 1 ]
}

@test "check_ip: rejects CIDR notation" {
  run check_ip "192.168.1.0/24"
  [ "$status" -eq 1 ]
}

@test "check_ip: accepts IP with octets > 255 (format-only check)" {
  # Note: check_ip only validates format (3 dots, digits), not octet range
  run check_ip "999.999.999.999"
  [ "$status" -eq 0 ]
}
