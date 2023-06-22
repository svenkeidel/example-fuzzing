#include <cstdint>
#include <cstdlib>

extern "C" size_t LLVMCustomMutator(uint8_t *data, size_t size, size_t maxSize, unsigned int seed) {
    return size;
}