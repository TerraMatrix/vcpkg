#!/bin/bash

# 指定输入文件夹路径和输出文件路径
input_folder="F:/vcpkg/mingw"
output_file="F:/hashes.txt"

# 清空输出文件
> "$output_file"

cd "F:/vcpkg/vcpkg-win7"

# 遍历输入文件夹下的所有文件
for file_path in "$input_folder"/*.zst; do
    # 获取文件名
    file_name=$(basename "$file_path")
    
    # 计算文件的SHA512哈希值
    hash_value=$(./vcpkg hash "$file_path")

    # 将文件名和哈希值写入输出文件
    echo "$file_name     $hash_value" >> "$output_file"
done

echo "Hash values saved to $output_file"