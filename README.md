# Flag Linux
<img src="./docs/flag_linux_logo.png" alt="Flag Linux" width="150px">

**Flag Linux** is a lightweight Linux distribution designed specifically for AI edge devices. It is tailored to provide a streamlined, efficient, and robust operating system for AI-driven applications and situational awareness tasks.

## Features
- Optimized for AI edge computing
- Lightweight and minimal footprint
- Supports hardware acceleration for AI workloads
- Seamless integration with AI SDKs and tools

## Directory Structure
```
.
├── bin/                # Essential binaries
├── build/              # Build scripts and intermediate files
├── config/             # Configuration files for the build system
├── device/             # Device-specific configurations
├── dl/                 # Downloaded source files
├── docs/               # Documentation and resources
├── etc/                # Configuration files for runtime
├── lib/                # Shared libraries
├── lichee/             # Lichee development components
│   ├── brandy/         # Bootloader-related files
│   └── linux-4.9/      # Kernel sources
├── manifest/           # Build manifest and metadata
├── package/            # Packages and custom software
├── prebuilt/           # Prebuilt binaries and components
├── scripts/            # Helper scripts for building and maintenance
├── softwinner/         # Platform-specific drivers and tools
├── target/             # Target-specific files and configurations
├── toolchain/          # Compilers and toolchain binaries
├── tools/              # Utilities and additional tools
├── usr/                # User binaries and data
└── var/                # Variable data files
```

## Getting Started
### Prerequisites
- Compatible edge device with support for Linux
- Minimum of 256MB RAM
- Storage of at least 500MB

### Installation
1. Download the latest Flag Linux image.
2. Flash the image onto your device using tools like `dd` or `balenaEtcher`:
   ```bash
   sudo dd if=flag_linux.img of=/dev/sdX bs=4M status=progress
   ```
3. Boot your device with the newly flashed image.

### Documentation
Comprehensive documentation can be found in the `./docs` directory or on our [official website](#).

## Contributing
We welcome contributions! Please see our [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for guidelines on how to help improve Flag Linux.

## License
Flag Linux is distributed under the [MIT License](./LICENSE).
