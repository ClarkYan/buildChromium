#!/bin/bash

# Copyright (c) 2016,  Regents of Clark YAN 
# Related github website https://github.com/ClarkYan/buildChromium 
# All rights reserved.

# Enter the directory of Desktop/chromium/src
cd src

# Build the chromium with TSAN v2.0

# Set the condition of TSAN by building with suppressions.txt
TSAN_OPTIONS="history_size=7 external_symbolizer_path=third_party/llvm-build/Release+Asserts/bin/llvm-symbolizer suppressions=tools/valgrind/tsan_v2/suppressions.txt report_signal_unsafe=0 report_thread_leaks=0 print_suppressions=1" 

# Run browser_tests or content_browsertests as each of a unittest of the gtest_filter test
out/Release/browser_tests  --no-sandbox --child-clean-exit  --gtest_filter=AutofillOptionsWebUITest.testOpenAutofillOptions

# After that, you will get the data race report of this test case
