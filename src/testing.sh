#!/bin/bash
# -*- coding: utf-8 -*-

###############################################################################
# Testing module
###############################################################################
#
# Defines useful testing functions and values
#
# Values:
#   - TestCount
#   - TestCountPass
#   - TestCountFail
#   - TestFails
#
# Functions:
#   - testing::unit_test_result     Invoked by a function such as
#                                   testing::test_string_length to print and
#                                   format the result
#   - testing::test_numeric_value   Compare and report the value of two numbers
#   - testing::test_string_value    Compare and report the value of two strings
#   - testing::test_string_length   Test and resport the length of a string
#   - testing::test_summary         Print test results
#   - testing::main                 Tests and example usage for this module
#
###############################################################################

# Variables

TestCount=0
TestCountPass=0
TestCountFail=0
declare -a TestFails

# Functions

testing::unit_test_result() {
  # Invoked by a function such as testing::test_string_length to print
  # and format the result
  #
  # Arguments
  #   - result        [ PASS | FAIL ]
  #   - test type     Test type description e.g. string length, numeric value
  #   - test name     The name of the test
  #   - test context  Additional text to display, if the test yields a failure
  #
  # Example
  #    testing::unit_test_result                   \
  #       'FAIL'                                   \
  #       'string length'                          \
  #       "Phone number should have 11 characters" \
  #       "Expected length: 11, actual length: $strlen_actual"

  local test_status
  local result="$1"
  local test_type="$2"
  local test_name="$3"
  local test_context="$4"

  case "$result" in
    PASS | pass)
      test_status='\033[32mPASS\033[0m'
      ((++TestCountPass))
      ;;

    FAIL | fail)
      test_status='\033[31mFAIL\033[0m'
      ((++TestCountFail))
      TestFails+=("$test_name")
      ;;

    *)
      test_status="UNKNOWN OUTCOME ($result)"
      ;;
  esac

  ((++TestCount))

  if [ -n "$test_context" ]; then
    printf '%b  "%s"  "%s"  Comment: "%s"\n' "$test_status" "$test_type" "$test_name" "$test_context"
  else
    printf '%b  "%s"  "%s"\n' "$test_status" "$test_type" "$test_name"
  fi

  return 0
}

testing::test_string_value() {
  # Compare and report the value of two strings
  #
  # Arguments:
  #  - expected number
  #  - actual number
  #  - test name
  #
  # Example
  #     testing::test_string_value    \
  #       "$expected_string" \
  #       "$actual_string"   \
  #       "test name"

  local value_expected="$1"
  local value_actual="$2"
  local test_name="$3"

  if [ "$value_expected" == "$value_actual" ]; then
    testing::unit_test_result 'PASS' \
      'string value' \
      "$test_name"
  else
    testing::unit_test_result 'FAIL' \
      'string value' \
      "$test_name" \
      "Expected value: $value_expected, actual value: $value_actual"
  fi

  return 0
}

testing::test_numeric_value() {
  # Compare and report the value of two numbers
  #
  # Arguments:
  #  - expected number
  #  - actual number
  #  - test name
  #
  # Example
  #     testing::test_numeric_value    \
  #         "$expected_value" \
  #         "$actual_value"   \
  #         'test name'

  local value_expected="$1"
  local value_actual="$2"
  local test_name="$3"

  if ((value_expected == value_actual)); then
    testing::unit_test_result 'PASS' \
      'numeric value' \
      "$test_name"
  else
    testing::unit_test_result 'FAIL' \
      'numeric value' \
      "$test_name" \
      "Expected value: $value_expected, actual value: $value_actual"
  fi

  return 0
}

testing::test_string_length() {
  # Test and resport the length of a string
  #
  # Arguments:
  #  - expected string length
  #  - the string whos length will be testes
  #  - test name
  #
  # Example
  #     testing::test_string_length     \
  #         "$expected_length" \
  #         "$actual_string"   \
  #         'test name'

  local strlen_expected="$1"
  local str="$2"
  local test_name="$3"
  local strlen_actual="${#str}"

  if ((strlen_expected == strlen_actual)); then
    testing::unit_test_result 'PASS' \
      'string length' \
      "$test_name"
  else
    testing::unit_test_result 'FAIL' \
      'string length' \
      "$test_name" \
      "Expected length: $strlen_expected, actual length: $strlen_actual"
  fi

  return 0
}

testing::test_summary() {
  # Print test results
  #
  # Arguments: None
  #
  # Example
  #     testing::test_summary

  printf 'Passes  %s\n' "$TestCountPass"
  printf 'Fails   %s\n' "$TestCountFail"
  printf 'Total   %s %s%% Success\n' "$TestCount" "$((100 * TestCountPass / TestCount))"
}

testing::list_failed_tests() {
  if ((TestCountFail != 0)); then
    printf 'Failures:\n'
    for failure in "${TestFails[@]}"; do
      printf '- %s\n' "${failure}"
    done
  fi
}

testing::main() {
  # Tests and example usage for this module
  #
  # Arguments: None
  #
  # Example
  #     testing::main

  testing::test_string_length 16 'test should pass' 'this test should pass (P)'
  testing::test_string_length 17 'test should fail' 'this test should fail (F)'
  testing::test_numeric_value 24 24 "Value shoud be 24 (P)"
  testing::test_numeric_value 24 25 "Value shoud be 24 (F)"
  testing::test_string_value "Bash" "Bash" "Function should yield \"bash\" (P)"
  testing::test_string_value "Bash" "bash" "Function should yield \"bash\" (F)"

  return 0
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
  testing::main
  testing::test_summary
fi
