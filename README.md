## Supported tags and respective Dockerfile links

#### Tags:

- [java17-latest](https://hub.docker.com/layers/zapp88/mandrel-multiarch/java17-latest/images/sha256-5d0c3713572ef43471abadf90a494a4ae2706827563a55a0b5ed617ff05ad1eb?context=explore)
- [java17-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/java17-mandrel21.3.0.0/images/sha256-5d0c3713572ef43471abadf90a494a4ae2706827563a55a0b5ed617ff05ad1eb?context=explore)
- [java11-latest](https://hub.docker.com/layers/zapp88/mandrel-multiarch/java11-latest/images/sha256-74dea283e0a0be0fe264fd21c6469458c8cb957a8baff95555eb0307afcac83c?context=explore)
- [java11-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/java11-mandrel21.3.0.0/images/sha256-74dea283e0a0be0fe264fd21c6469458c8cb957a8baff95555eb0307afcac83c?context=explore)
- [arm64-java17-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/arm64-java17-mandrel21.3.0.0/images/sha256-425d897f24961fc7deaf10294dad0369a9d4754e83c761bbc11852f152a423e8?context=explore)
- [amd64-java17-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/amd64-java17-mandrel21.3.0.0/images/sha256-5d0c3713572ef43471abadf90a494a4ae2706827563a55a0b5ed617ff05ad1eb?context=explore)
- [amd64-java11-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/amd64-java11-mandrel21.3.0.0/images/sha256-74dea283e0a0be0fe264fd21c6469458c8cb957a8baff95555eb0307afcac83c?context=explore)
- [arm64-java11-mandrel21.3.0.0](https://hub.docker.com/layers/zapp88/mandrel-multiarch/arm64-java11-mandrel21.3.0.0/images/sha256-594c8cf05e7a3f836779dba827a30f6fc96365e5b3587bf91a697468b004b74f?context=explore)

#### Why no ':latest' tag ?

This image is provided in 3 differing versions
(different java version)-(different architecture)-(different version) since the choice of java version should be explicit we only provide java17-latest and java11-latest.

#### Dockerfile:

<https://raw.githubusercontent.com/zapp88/mandrel-multiarch/master/Dockerfile>

#### Where to file issues:

<https://github.com/zapp88/mandrel-multiarch/issues>

Supported architectures: amd64, arm64v8

## What is Mandrel?

Mandrel is a [downstream distribution of the GraalVM community edition](https://developers.redhat.com/blog/2020/06/05/mandrel-a-community-distribution-of-graalvm-for-the-red-hat-build-of-quarkus/). Mandrel's main goal is to provide a native-image release specifically to support [Quarkus](https://quarkus.io). The aim is to align the native-image capabilities from GraalVM with OpenJDK and Red Hat Enterprise Linux libraries to improve maintainability for native [Quarkus](https://quarkus.io) applications. Mandrel can best be described as a distribution of a regular OpenJDK with a specially packaged GraalVM Native Image builder (native-image).

### How Does Mandrel Differ From Graal

Mandrel releases are built from a code base derived from the upstream GraalVM code base, with only minor changes but some significant exclusions. A full distribution of GraalVM is much more than native-image: it has polyglot support, the Truffle framework which allows for efficient implementation of interpreters, an LLVM compiler back end for native image, the libgraal JIT compiler as a replacement for Hotspot’s C2 server compiler and much more. Mandrel is the small subset of that functionality we support for the native-image use-case.

### Mandrel's native-image also doesn't include the following features:

The experimental image-build server, i.e., the --experimental-build-server option.
The LLVM backend, i.e., the -H:CompilerBackend=llvm option.
The musl libc implementation, i.e., the --libc=musl option.
Support for generating static native images, i.e., the --static option.
Support for non JVM-based languages and polyglot, i.e., the --language:<languageId> option.
Mandrel is also built slightly differently to GraalVM, using the standard OpenJDK project release of jdk11u. This means it does not profit from a few small enhancements that Oracle have added to the version of OpenJDK used to build their own GraalVM downloads. Most of these enhancements are to the JVMCI module that allows the Graal compiler to be run inside OpenJDK. The others are small cosmetic changes to behaviour. These enhancements may in some cases cause minor differences in the progress of native image generation. They should not cause the resulting images themselves to execute in a noticeably different manner.

## License

View license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
