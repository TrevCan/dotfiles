#!/usr/bin/env python3

# original at https://gist.github.com/yinonburgansky/7be4d0489a0df8c06a923240b8eb0191
# modified for ease of use in Hyprland

# calculations are based on http://www.esreality.com/index.php?a=post&id=1945096
# assuming Windows 10 uses the same calculation as Windows 7.
# guesses have been made — calculation is not 100% accurate.
# touchpad users: ensure your touchpad is calibrated with `sudo libinput measure touchpad-size`

import struct
import os
import sys
# import matplotlib.pyplot as plt  # Optional: uncomment for curve visualization

# ===== PARAMETERS =====
# Set these according to your device:
device_dpi = 96  # Mouse DPI
screen_dpi = 96
screen_scaling_factor = 1
sample_point_count = 20  # Increase for more accurate curves
sensitivity_factor = 6   # See table below
# Sensitivity factor translation (Windows slider notches):
# 1 = 0.1 | 2 = 0.2 | 3 = 0.4 | 4 = 0.6 | 5 = 0.8 | 6 = 1.0 (default)
# 7 = 1.2 | 8 = 1.4 | 9 = 1.6 | 10 = 1.8 | 11 = 2.0
# ===== END PARAMETERS =====

def find_arg(arg):
    return arg in sys.argv

if find_arg("help") or find_arg("-h") or find_arg("--help") or find_arg("h"):
    print(f'{sys.argv[0]} [[accel_profile] [scroll_points] device=<device>]')
    print('To get the device, run `hyprctl devices` and get its name')
    exit(0)

# Scale factors (approximate Windows model)
scale_x = device_dpi / 1e3
scale_y = screen_dpi / 1e3 / screen_scaling_factor * sensitivity_factor

def float16x16(num):
    return struct.unpack('<i', num[:-4])[0] / int(0xffff)


# Windows 10 registry curve points
# careful copying this into a terminal!!, probably will have to use some kind of fancy word processor that doesn't take some of these characters as escape thingies.

# windows 10 registry values:
# HKEY_CURRENT_USER\Control Panel\Mouse\SmoothMouseXCurve
X = [
b'\x00\x00\x00\x00\x00\x00\x00\x00',
b'\x15\x6e\x00\x00\x00\x00\x00\x00',
b'\x00\x40\x01\x00\x00\x00\x00\x00',
b'\x29\xdc\x03\x00\x00\x00\x00\x00',
b'\x00\x00\x28\x00\x00\x00\x00\x00',
]
# HKEY_CURRENT_USER\Control Panel\Mouse\SmoothMouseYCurve
Y=[
b'\x00\x00\x00\x00\x00\x00\x00\x00',
b'\xfd\x11\x01\x00\x00\x00\x00\x00',
b'\x00\x24\x04\x00\x00\x00\x00\x00',
b'\x00\xfc\x12\x00\x00\x00\x00\x00',
b'\x00\xc0\xbb\x01\x00\x00\x00\x00',
]


windows_points = [[float16x16(x), float16x16(y)] for x, y in zip(X, Y)]
points = [[x * scale_x, y * scale_y] for x, y in windows_points]

def get_device():
    for i in sys.argv:
        if str(i).startswith('device='):
            return str(i)[7:]

def find2points(x):
    i = 0
    while i < len(points) - 2 and x >= points[i + 1][0]:
        i += 1
    return points[i], points[i + 1]

def interpolate(x):
    (x0, y0), (x1, y1) = find2points(x)
    return ((x - x0) * y1 + (x1 - x) * y0) / (x1 - x0)

def sample_points(count):
    last_point = -2
    max_x = points[last_point][0]
    step = max_x / (count + last_point)
    sample_points_x = [si * step for si in range(count)]
    sample_points_y = [interpolate(x) for x in sample_points_x]
    return sample_points_x, sample_points_y

sample_points_x, sample_points_y = sample_points(sample_point_count)
step = sample_points_x[1] - sample_points_x[0]
sample_points_str = " ".join(["%.3f" % number for number in sample_points_y])

print(f'\tPoints: {sample_points_str}')
print(f'\tStep size: {step:0.10f}')

def hyprctl(device, option, arg):
    os.system(f"hyprctl keyword 'device[{device}]:{option}' '{arg}'")

if find_arg("accel_profile"):
    device = get_device()
    print(f"Setting device '{device}':accel_profile using hyprctl")
    hyprctl(device, 'accel_profile', f'custom {step} {sample_points_str}')

if find_arg("scroll_points"):
    device = get_device()
    print(f"Setting device '{device}':scroll_points using hyprctl")
    hyprctl(device, 'scroll_points', f'{step} {sample_points_str}')
