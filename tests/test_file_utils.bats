#!/usr/bin/env bats
# Unit tests for file utility functions in OracleShellInstall.sh

setup() {
  load 'test_helper'
  setup_test_env
  source_functions
}

teardown() {
  teardown_test_env
}

#==============================================================#
#                     check_file tests                          #
#==============================================================#

@test "check_file: returns 0 for existing file" {
  local testfile="$TEST_TMPDIR/existing_file"
  touch "$testfile"
  run check_file "$testfile"
  [ "$status" -eq 0 ]
}

@test "check_file: returns 1 for non-existing file" {
  run check_file "$TEST_TMPDIR/nonexistent_file"
  [ "$status" -eq 1 ]
}

@test "check_file: returns 0 for existing directory" {
  local testdir="$TEST_TMPDIR/existing_dir"
  mkdir -p "$testdir"
  run check_file "$testdir"
  [ "$status" -eq 0 ]
}

@test "check_file: returns 1 for empty path" {
  run check_file ""
  [ "$status" -eq 1 ]
}

#==============================================================#
#                     mv_file tests                             #
#==============================================================#

@test "mv_file: backs up file as .original when no .original exists" {
  local testfile="$TEST_TMPDIR/config"
  echo "original content" > "$testfile"

  mv_file "$testfile"

  [ -f "${testfile}.original" ]
  [ ! -f "$testfile" ]
}

@test "mv_file: does not overwrite existing .original" {
  local testfile="$TEST_TMPDIR/config"
  echo "modified content" > "$testfile"
  echo "first original" > "${testfile}.original"

  mv_file "$testfile"

  # .original should still have the first content
  [ "$(cat "${testfile}.original")" = "first original" ]
}

@test "mv_file: handles non-existing file gracefully" {
  run mv_file "$TEST_TMPDIR/nonexistent"
  [ "$status" -eq 0 ]
}

#==============================================================#
#                     rm_file tests                             #
#==============================================================#

@test "rm_file: removes existing file" {
  local testfile="$TEST_TMPDIR/to_remove"
  touch "$testfile"

  rm_file "$testfile"

  [ ! -f "$testfile" ]
}

@test "rm_file: removes existing directory" {
  local testdir="$TEST_TMPDIR/to_remove_dir"
  mkdir -p "$testdir"

  rm_file "$testdir"

  [ ! -d "$testdir" ]
}

@test "rm_file: handles non-existing file gracefully" {
  run rm_file "$TEST_TMPDIR/nonexistent"
  [ "$status" -eq 0 ]
}

#==============================================================#
#                   write_file tests                            #
#==============================================================#

@test "write_file: overwrites file when flag is Y" {
  local testfile="$TEST_TMPDIR/write_test"
  echo "old content" > "$testfile"

  write_file "Y" "$testfile" "new content"

  [ "$(cat "$testfile")" = "new content" ]
}

@test "write_file: appends to file when flag is N" {
  local testfile="$TEST_TMPDIR/append_test"
  echo "first line" > "$testfile"

  write_file "N" "$testfile" "second line"

  run grep -c "first line" "$testfile"
  [ "$output" = "1" ]
  run grep -c "second line" "$testfile"
  [ "$output" = "1" ]
}

@test "write_file: creates new file when flag is Y and file doesn't exist" {
  local testfile="$TEST_TMPDIR/new_file"

  write_file "Y" "$testfile" "brand new content"

  [ -f "$testfile" ]
  [ "$(cat "$testfile")" = "brand new content" ]
}

@test "write_file: creates new file when flag is N and file doesn't exist" {
  local testfile="$TEST_TMPDIR/new_append_file"

  write_file "N" "$testfile" "appended content"

  [ -f "$testfile" ]
  [ "$(cat "$testfile")" = "appended content" ]
}

#==============================================================#
#                 backup_restore_file tests                     #
#==============================================================#

@test "backup_restore_file: creates .original backup of unmodified file" {
  local testfile="$TEST_TMPDIR/sysctl.conf"
  echo "vm.swappiness = 10" > "$testfile"

  backup_restore_file "$testfile"

  [ -f "${testfile}.original" ]
  [ "$(cat "${testfile}.original")" = "vm.swappiness = 10" ]
}

@test "backup_restore_file: restores from .original when OracleBegin marker exists" {
  local testfile="$TEST_TMPDIR/sysctl.conf"
  printf "vm.swappiness = 10\n# OracleBegin\nkernel.sem = 250 32000 100 128\n" > "$testfile"
  echo "vm.swappiness = 10" > "${testfile}.original"

  backup_restore_file "$testfile"

  # File should be restored from .original
  [ "$(cat "$testfile")" = "vm.swappiness = 10" ]
}

@test "backup_restore_file: creates empty .original when file doesn't exist" {
  local testfile="$TEST_TMPDIR/nonexistent.conf"

  backup_restore_file "$testfile"

  [ -f "${testfile}.original" ]
  [ ! -s "${testfile}.original" ]
}
