TOP_ROOT=<your path>
PREFIX=$TOP_ROOT/ffmpeg

FFMPEG_DIR=$TOP_ROOT/ffmpeg
FFMPEG_BINARY_DIR=$FFMPEG_DIR/lib
FFMPEG_INCLUDE_DIR=$FFMPEG_DIR/include

OPENSSL_DIR=$TOP_ROOT/openssl
OPENSSL_BINARY_DIR=$OPENSSL_DIR/lib
OPENSSL_INCLUDE_DIR=$OPENSSL_DIR/include

SSL_EXTRA_LDFLAGS="-libpath:$OPENSSL_BINARY_DIR"
SSL_EXTRA_CFLAGS="-I$OPENSSL_INCLUDE_DIR"

./configure \
        --incdir=$FFMPEG_INCLUDE_DIR \
        --libdir=$FFMPEG_BINARY_DIR \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=x86_64 \
        --enable-shared \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 $OPTIMIZE_CFLAGS $SSL_EXTRA_CFLAGS" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib ssl.lib crypto.lib $SSL_EXTRA_LDFLAGS -DOPENSSL_API_COMPAT=0x00908000L " \
        --prefix=./ffmpeg
        --disable-static \
        --disable-ffplay \
        --disable-ffmpeg \
        --disable-ffprobe \
        --disable-symver \
        --enable-gpl \
        --enable-postproc \
        --disable-encoders \
        --disable-muxers \
        --disable-bsfs \
        --disable-indevs \
        --disable-outdevs \
        --disable-devices \
        --enable-asm \
        --enable-shared \
        --enable-small \
        --enable-encoder=png \
        --enable-nonfree \
        --enable-openssl \
        --enable-protocol=file,ftp,http,https,httpproxy,hls,mmsh,mmst,pipe,rtmp,rtmps,rtmpt,rtmpts,rtp,sctp,srtp,tcp,udp \
        $ADDITIONAL_CONFIGURE_FLAG
make -j4
make install
