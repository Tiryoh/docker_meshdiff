FROM nginx:1.18-alpine
LABEL maintainer="Tiryoh<tiryoh@gmail.com>"

RUN apk add --no-cache \
    su-exec \
    git

COPY ./entrypoint.sh /
COPY ./unpack-objects.sh /
COPY ./meshdiff /usr/share/nginx/html
WORKDIR /usr/share/nginx/html/js

RUN curl -L https://github.com/mrdoob/three.js/raw/r118/build/three.min.js -o three.min.js && \
    curl -L https://github.com/mrdoob/three.js/raw/r118/examples/js/loaders/STLLoader.js -o STLLoader.js && \
    curl -L https://github.com/mrdoob/three.js/raw/r118/examples/js/controls/OrbitControls.js -o OrbitControls.js && \
    curl -L https://github.com/imaya/zlib.js/raw/0.3.1/bin/inflate_stream.min.js -o inflate_stream.min.js

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]