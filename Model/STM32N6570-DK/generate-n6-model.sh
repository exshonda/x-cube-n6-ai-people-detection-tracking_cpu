#!/bin/bash

# generate yolox model
stedgeai generate --no-inputs-allocation --no-outputs-allocation --model st_yolo_x_nano_480_1.0_0.25_3_st_int8.tflite --target stm32n6 --binary --address 0x70380000
cp st_ai_output/network.c .
cp st_ai_output/network.h .
cp st_ai_output/network_config.h .
cp st_ai_output/network_data.h .
cp st_ai_output/network_data.c .
cp st_ai_output/network_data_params.c .
cp st_ai_output/network_data_params.h .
cp st_ai_output/network_data.bin .
arm-none-eabi-objcopy -I binary network_data.bin --change-addresses 0x70380000 -O ihex network_data.hex