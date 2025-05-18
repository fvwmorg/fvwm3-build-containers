# FVWM BUILD CONTAINER

This repository holds the definition of the `Dockerfile`s responsible for
setting up the environment used to compile fvwm3 changes in GitHub's CI
pipeline -- for PRs and releases.

For how this is used, see both the following files in the fvwm3.git repo:

* `.github/workflows/ccpp.yml`
* `.github/workflows/release.yml`

## Dockerfiles

fvwm3 compiles against two different environments.

One is a libc-based environment, based off Debian Trixie, which also installs
both `clang` and `gcc` so that PRs are compiled against those two different
compilers.

The other is a musl-based environment, based off Alpine Linux (edge).

### Libc (Debian Trixie)

See: `./Dockerfile`

This Dockerfile holds the package definitions needed to setup the compilation
environment.  Note that we compress as many commands into a single `RUN`
statement so as to avoid having too many squashfs layers in the image, as this
can increase its size.

### Musl (Alpine)

See: `./Dockerfile-alpine`

Similar to the `Libc` image, this holds `apk` definitions for setting up the
compilation environment.

## Building the Images

There is a wrapper script, `./build.sh` which accepts the following arguments:

* `libc` -- which will compile the libc environment
* `musl` -- which will compile the musl environment

Failure to provide one of those will result in the script doing nothing.

The resultant image will be:

* `fvwmorg/fvwm3-build:latest` -- if the build is `libc`
* `fvwmorg/fvwm3-build-alpine:latest` -- if the build is `musl`

Hence, these images are always tagged with `latest`.

To test these images locally, it's advisable to change the `Dockerfile` in
fvwm3's git repository, such that its `FROM` line points to one of the above
images, depending on what needs testing.

The images themselves are hosted on Docker Hub, under the `fvwmorg`
organisatioon, hence the prefix used to match the image name.

## Pushing the Images

Once enough testing has happened, the images can be pushed with:

```
docker push fvwmorg/$XXX
```

Where, `$XXX` is the Docker image name in question.  Note that write access
will be needed to the Docker Hub fvwmorg account.
