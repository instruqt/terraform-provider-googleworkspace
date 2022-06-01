NAME ?= terraform-provider-googleworkspace
GOOS ?= linux
GOARCH ?= amd64
VERSION ?= v0.0.0_local

build:
	echo "Building ${NAME}_${VERSION} (${GOOS}/${GOARCH})" ; \
	GOOS=${GOOS} GOARCH=${GOARCH} go build \
		-a \
		-o build/${NAME}_${VERSION} \
		.

package:
	echo "Packaging ${NAME} (${GOOS}/${GOARCH})" ; \
	zip -j ${NAME}_$${VERSION:1}_${GOOS}_${GOARCH}.zip build/${NAME}_${VERSION}


clean:
	echo "Cleaning build dir" ; \
	rm -rf build/*

deps:
	go mod vendor
