# Magi - Centos JDK

## Overview
This is the base Centos 7 + JDK 8 Image that serves as the basis for all the other images

## Documentation
### Standard Directory Structure
```bash
\_ /opt
    \_ app
        \_ bin - user scripts
        \_ conf - application configuration files, common machine learning models, etc...
        \_ data - where applications can write persistent data
        \_ pkg - binaries for applications
        \_ tmp - tmp directory for applications
```