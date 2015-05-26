################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
Microblaze_AI.elf.size \

ELFCHECK += \
Microblaze_AI.elf.elfcheck \


# All Target
all: Microblaze_AI.elf secondary-outputs

# Tool invocations
Microblaze_AI.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../standalone_bsp_0/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.50.c -mno-xl-soft-mul -mhard-float -Wl,--no-relax -Wl,--gc-sections -o "Microblaze_AI.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Microblaze_AI.elf.size: Microblaze_AI.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size Microblaze_AI.elf  |tee "Microblaze_AI.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

Microblaze_AI.elf.elfcheck: Microblaze_AI.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck Microblaze_AI.elf -hw ../../MicroBlaze_hw_platform/system.xml -pe microblaze_0  |tee "Microblaze_AI.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) Microblaze_AI.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
