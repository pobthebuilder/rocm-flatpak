

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

2.a. (optional) Export the build product to a single-file bundle
```
flatpak build-bundle --runtime ~/rocm-repo rocm.flatpak org.freedesktop.Platform.GL.ROCm 22.08
```

3. Using ROCm for OpenCL:
Currently the Freedesktop SDK doesn't know how to autoload the AMD ROCm
extension. Until it does you'll need to update the FLATPAK_GL_DRIVERS
environment variable to run OpenCL apps. Example:
```
❯ export FLATPAK_GL_DRIVERS=ROCm:default
```

If you use systemd, you can use the following to set this permanently
into your environment:
```
mkdir -p ~/.config/environment.d
echo FLATPAK_GL_DRIVERS=ROCm:default | tee ~/.config/environment.d/60-flatpak_gl_drivers.conf
```
After a logout and login, or reboot you should see FLATPAK_GL_DRIVERS
set in the environment.

4. Notes & Running apps:
Currently the --device=dri flag doesn't enable access to /dev/kfd, which
is required for ROCm to function. You'll need to pass --device=all to
any apps to allow ROCm to see /dev/kfd.  You can use Flatseal to add
this to apps and make it permanent.
https://github.com/flatpak/flatpak/issues/5383

```
❯ flatpak run --device=all --command=/bin/bash --devel org.freedesktop.Platform.ClInfo
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

There is also a bug in the Freedesktop SDK provided Mesa OpenCL with
(?) some AMD cards (?) which stops ROCm OpenCL device being used even
when hard coded in the app.  This happens with e.g. the Radeon 5500M in
the MacbookPro16,4.
https://gitlab.freedesktop.org/mesa/mesa/-/issues/4189
In this case, you can force apps to only "see" the ROCm OpenCL
implementation by setting the following environment variable into the
app using e.g. Flatseal:

```
OCL_ICD_VENDORS=/usr/lib/x86_64-linux-gnu/GL/ROCm/OpenCL/vendors
```


