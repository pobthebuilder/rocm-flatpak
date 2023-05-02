

rocm-flatpak
============

This repo is an initial cut of building the AMD ROCm stack for
Flatpak 22.08.  It currently builds OpenCL. The ROCm Runtime
Extension it builds sits on top of the Mesa in Freedesktop SDK
org.freedesktop.Platform.GL.default; so you will need to use both to
get working OpenGL+OpenCL.

Building
--------

22.08 is based on BuildStream1. Install Buildstream1 and plugins:
1. Install BuildStream1:
```
pip3 install 'BuildStream == 1.*'\n
pip3 install buildstream-external
```
2. Build this repo, and export to a Flatpak repo:
```
bst build rocm-flatpak.bst
bst checkout rocm-flatpak.bst ~/rocm-repo
flatpak remote-add rocm-repo ~/rocm-repo --no-gpg-verify
flatpak install org.freedesktop.Platform.GL.ROCm
```

3. Using ROCm for OpenCL:
Currently the Freedesktop SDK doesn't know how to autoload the AMD ROCm
extension. Until it does you'll need to update the FLATPAK_GL_DRIVERS
environment variable to run OpenCL apps. Example:
```
❯ export FLATPAK_GL_DRIVERS=ROCm:default
❯ flatpak run --command=/bin/bash --devel org.freedesktop.Platform.ClInfo
[📦 org.freedesktop.Platform.ClInfo ~]$ clinfo
Number of platforms                               2
  Platform Name                                   Clover
  Platform Vendor                                 Mesa
  Platform Version                                OpenCL 1.1 Mesa 23.0.2 (git-4d5e73870e)
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd
  Platform Extensions function suffix             MESA

  Platform Name                                   AMD Accelerated Parallel Processing
  Platform Vendor                                 Advanced Micro Devices, Inc.
  Platform Version                                OpenCL 2.1 AMD-APP (3513.0)
  Platform Profile                                FULL_PROFILE
  Platform Extensions                             cl_khr_icd cl_amd_event_callback
  Platform Extensions function suffix             AMD
  Platform Host timer resolution                  1ns
```
