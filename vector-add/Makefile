NVCC = nvcc
ARCH = sm_75
NVCCFLAGS = -arch=$(ARCH) -O3 -std=c++17 -lineinfo

TARGET = vector-add
SRC = vector-add.cu

all: $(TARGET)

$(TARGET): $(SRC)
	$(NVCC) $(NVCCFLAGS) $< -o $@

profile: $(TARGET)
	nsys_easy ./$(TARGET)

clean:
	rm -f $(TARGET) *.nsys-rep *.sqlite *.qdrep

.PHONY: all profile clean