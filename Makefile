as = riscv64-elf-gcc
asflags = -nostdlib -static
src_dir = src
bin_dir = bin

sources = $(wildcard $(src_dir)/*.s)
targets = $(patsubst $(src_dir)/%.s, $(bin_dir)/%, $(sources))

all: $(bin_dir) $(targets)

$(bin_dir):
	mkdir -p $(bin_dir)

$(bin_dir)/%: $(src_dir)/%.s
	$(as) $(asflags) $< -o $@

clean:
	rm -rf $(bin_dir)

.PHONY: all clean
