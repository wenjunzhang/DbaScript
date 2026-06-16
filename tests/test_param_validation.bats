#!/usr/bin/env bats
# Unit tests for parameter validation functions in OracleShellInstall.sh

setup() {
  load 'test_helper'
  setup_test_env
  source_functions
}

teardown() {
  teardown_test_env
}

#==============================================================#
#                   checkpara_NULL tests                        #
#==============================================================#

@test "checkpara_NULL: exits with error when value is empty" {
  run checkpara_NULL "-o" ""
  [ "$status" -eq 1 ]
}

@test "checkpara_NULL: exits with error when value starts with dash" {
  run checkpara_NULL "-o" "-x"
  [ "$status" -eq 1 ]
}

@test "checkpara_NULL: succeeds when value is provided" {
  run checkpara_NULL "-o" "orcl"
  [ "$status" -eq 0 ]
}

@test "checkpara_NULL: succeeds with numeric value" {
  run checkpara_NULL "-bs" "8192"
  [ "$status" -eq 0 ]
}

#==============================================================#
#                   checkpara_YN tests                          #
#==============================================================#

@test "checkpara_YN: accepts uppercase Y" {
  run checkpara_YN "-gui" "Y"
  [ "$status" -eq 0 ]
}

@test "checkpara_YN: accepts lowercase y" {
  run checkpara_YN "-gui" "y"
  [ "$status" -eq 0 ]
}

@test "checkpara_YN: accepts uppercase N" {
  run checkpara_YN "-gui" "N"
  [ "$status" -eq 0 ]
}

@test "checkpara_YN: accepts lowercase n" {
  run checkpara_YN "-gui" "n"
  [ "$status" -eq 0 ]
}

@test "checkpara_YN: rejects invalid value 'yes'" {
  run checkpara_YN "-gui" "yes"
  [ "$status" -eq 1 ]
}

@test "checkpara_YN: rejects invalid value 'no'" {
  run checkpara_YN "-gui" "no"
  [ "$status" -eq 1 ]
}

@test "checkpara_YN: rejects empty value" {
  run checkpara_YN "-gui" ""
  [ "$status" -eq 1 ]
}

@test "checkpara_YN: rejects numeric value" {
  run checkpara_YN "-gui" "1"
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_tf tests                          #
#==============================================================#

@test "checkpara_tf: accepts 'true'" {
  run checkpara_tf "-cdb" "true"
  [ "$status" -eq 0 ]
}

@test "checkpara_tf: accepts 'false'" {
  run checkpara_tf "-cdb" "false"
  [ "$status" -eq 0 ]
}

@test "checkpara_tf: rejects 'True' (case sensitive)" {
  run checkpara_tf "-cdb" "True"
  [ "$status" -eq 1 ]
}

@test "checkpara_tf: rejects 'FALSE' (case sensitive)" {
  run checkpara_tf "-cdb" "FALSE"
  [ "$status" -eq 1 ]
}

@test "checkpara_tf: rejects 'yes'" {
  run checkpara_tf "-cdb" "yes"
  [ "$status" -eq 1 ]
}

@test "checkpara_tf: rejects empty value" {
  run checkpara_tf "-cdb" ""
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_REDUN tests                       #
#==============================================================#

@test "checkpara_REDUN: accepts EXTERNAL" {
  run checkpara_REDUN "-dr" "EXTERNAL"
  [ "$status" -eq 0 ]
}

@test "checkpara_REDUN: accepts NORMAL" {
  run checkpara_REDUN "-dr" "NORMAL"
  [ "$status" -eq 0 ]
}

@test "checkpara_REDUN: accepts HIGH" {
  run checkpara_REDUN "-dr" "HIGH"
  [ "$status" -eq 0 ]
}

@test "checkpara_REDUN: rejects lowercase 'external'" {
  run checkpara_REDUN "-dr" "external"
  [ "$status" -eq 1 ]
}

@test "checkpara_REDUN: rejects invalid value 'LOW'" {
  run checkpara_REDUN "-dr" "LOW"
  [ "$status" -eq 1 ]
}

@test "checkpara_REDUN: rejects empty value" {
  run checkpara_REDUN "-dr" ""
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_NUMERIC tests                     #
#==============================================================#

@test "checkpara_NUMERIC: accepts valid integer" {
  run checkpara_NUMERIC "-rs" "1024"
  [ "$status" -eq 0 ]
}

@test "checkpara_NUMERIC: accepts zero" {
  run checkpara_NUMERIC "-rs" "0"
  [ "$status" -eq 0 ]
}

@test "checkpara_NUMERIC: accepts large number" {
  run checkpara_NUMERIC "-rs" "999999999"
  [ "$status" -eq 0 ]
}

@test "checkpara_NUMERIC: rejects negative number" {
  run checkpara_NUMERIC "-rs" "-1"
  [ "$status" -eq 1 ]
}

@test "checkpara_NUMERIC: rejects decimal number" {
  run checkpara_NUMERIC "-rs" "10.5"
  [ "$status" -eq 1 ]
}

@test "checkpara_NUMERIC: rejects alphabetic string" {
  run checkpara_NUMERIC "-rs" "abc"
  [ "$status" -eq 1 ]
}

@test "checkpara_NUMERIC: rejects mixed alphanumeric" {
  run checkpara_NUMERIC "-rs" "1024MB"
  [ "$status" -eq 1 ]
}

@test "checkpara_NUMERIC: rejects empty value" {
  run checkpara_NUMERIC "-rs" ""
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_DBS tests                         #
#==============================================================#

@test "checkpara_DBS: accepts 2048" {
  run checkpara_DBS "-bs" "2048"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBS: accepts 4096" {
  run checkpara_DBS "-bs" "4096"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBS: accepts 8192" {
  run checkpara_DBS "-bs" "8192"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBS: accepts 16384" {
  run checkpara_DBS "-bs" "16384"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBS: accepts 32768" {
  run checkpara_DBS "-bs" "32768"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBS: rejects 1024 (not valid block size)" {
  run checkpara_DBS "-bs" "1024"
  [ "$status" -eq 1 ]
}

@test "checkpara_DBS: rejects 65536" {
  run checkpara_DBS "-bs" "65536"
  [ "$status" -eq 1 ]
}

@test "checkpara_DBS: rejects non-numeric value" {
  run checkpara_DBS "-bs" "abc"
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_NCHARSET tests                    #
#==============================================================#

@test "checkpara_NCHARSET: accepts UTF8" {
  run checkpara_NCHARSET "-nc" "UTF8"
  [ "$status" -eq 0 ]
}

@test "checkpara_NCHARSET: accepts AL16UTF16" {
  run checkpara_NCHARSET "-nc" "AL16UTF16"
  [ "$status" -eq 0 ]
}

@test "checkpara_NCHARSET: rejects invalid charset" {
  run checkpara_NCHARSET "-nc" "LATIN1"
  [ "$status" -eq 1 ]
}

@test "checkpara_NCHARSET: rejects lowercase utf8" {
  run checkpara_NCHARSET "-nc" "utf8"
  [ "$status" -eq 1 ]
}

@test "checkpara_NCHARSET: rejects empty value" {
  run checkpara_NCHARSET "-nc" ""
  [ "$status" -eq 1 ]
}

#==============================================================#
#                   checkpara_DBCHARSET tests                   #
#==============================================================#

@test "checkpara_DBCHARSET: accepts AL32UTF8" {
  run checkpara_DBCHARSET "-c" "AL32UTF8"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBCHARSET: accepts ZHS16GBK" {
  run checkpara_DBCHARSET "-c" "ZHS16GBK"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBCHARSET: accepts WE8ISO8859P1" {
  run checkpara_DBCHARSET "-c" "WE8ISO8859P1"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBCHARSET: accepts JA16SJIS" {
  run checkpara_DBCHARSET "-c" "JA16SJIS"
  [ "$status" -eq 0 ]
}

@test "checkpara_DBCHARSET: rejects invalid charset" {
  run checkpara_DBCHARSET "-c" "INVALID_CHARSET"
  [ "$status" -eq 1 ]
}

@test "checkpara_DBCHARSET: rejects empty value" {
  run checkpara_DBCHARSET "-c" ""
  [ "$status" -eq 1 ]
}
