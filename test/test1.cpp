#include <assert.h>

#include <cifuzz/cifuzz.h>
#include <fuzzer/FuzzedDataProvider.h>

#include "../cJSON.h"
#include <string>

FUZZ_TEST_SETUP() {
  // Perform any one-time setup required by the FUZZ_TEST function.
}

FUZZ_TEST(const uint8_t *data, size_t size) {

  FuzzedDataProvider fuzzed_data(data, size);

  std::string input fuzzed_data.ConsumeRandomLengthString();

  cJSON *json = cJSON_Parse(input.c_str());
}
