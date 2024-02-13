#!/bin/bash

# 检查是否安装了 libicns
command -v png2icns >/dev/null 2>&1 || { echo >&2 "libicns 未安装"; exit 1; }

# 定义图标尺寸
pixels=(16 32 128 256 512)

# 设置工作目录
work_dir="${PWD}/icons.iconset"

# 提示用户输入 PNG 文件路径
echo "请输入 PNG 文件路径："
read png_file

# 检查文件是否存在
if [ ! -e "$png_file" ]; then
    echo "PNG 文件不存在！"
    exit 1
fi

# 创建工作目录
mkdir -p "$work_dir"

# 根据不同尺寸生成图标
for px in "${pixels[@]}"; do
    convert -resize "${px}x${px}!" "$png_file" "$work_dir/icon_${px}x${px}.png"
done

# 生成最终的 .icns 文件
output_icns_file="${png_file%.png}.icns"
png2icns "$output_icns_file" $work_dir/icon_*.png

echo "已生成 $output_icns_file"
