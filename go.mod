module github.com/signalfx/splunk-otel-collector/tests

go 1.20

require (
	github.com/antonmedv/expr v1.9.0
	github.com/cenkalti/backoff/v4 v4.2.1
	github.com/fsnotify/fsnotify v1.7.0
	github.com/gogo/protobuf v1.3.2
	github.com/golang/snappy v0.0.4
	github.com/google/go-cmp v0.6.0
	github.com/gorilla/mux v1.8.0
	github.com/hashicorp/vault/api v1.0.4
	github.com/jaegertracing/jaeger v1.38.0
	github.com/knadh/koanf v1.5.0
	github.com/magiconair/properties v1.8.7
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/translator/jaeger v0.57.2
	github.com/prometheus/client_model v0.5.0
	github.com/prometheus/common v0.45.0
	github.com/spf13/cast v1.5.0
	github.com/spf13/pflag v1.0.5
	github.com/stretchr/testify v1.8.4
	go.etcd.io/bbolt v1.3.7
	go.etcd.io/etcd/client/v2 v2.305.9
	go.opencensus.io v0.24.0
	go.opentelemetry.io/collector/component v0.91.0
	go.opentelemetry.io/collector/config/confighttp v0.91.0
	go.opentelemetry.io/collector/config/configtelemetry v0.91.0
	go.opentelemetry.io/collector/confmap v0.91.0
	go.opentelemetry.io/collector/connector v0.91.0
	go.opentelemetry.io/collector/consumer v0.91.0
	go.opentelemetry.io/collector/exporter v0.91.0
	go.opentelemetry.io/collector/exporter/otlpexporter v0.91.0
	go.opentelemetry.io/collector/extension v0.91.0
	go.opentelemetry.io/collector/pdata v1.0.0
	go.opentelemetry.io/collector/processor v0.91.0
	go.opentelemetry.io/collector/receiver v0.91.0
	go.opentelemetry.io/collector/receiver/otlpreceiver v0.91.0
	go.opentelemetry.io/collector/semconv v0.91.0
	go.opentelemetry.io/otel/metric v1.21.0
	go.opentelemetry.io/otel/trace v1.21.0
	go.uber.org/atomic v1.11.0
	go.uber.org/multierr v1.11.0
	go.uber.org/zap v1.26.0
	golang.org/x/exp v0.0.0-20230711023510-fffb14384f22
	golang.org/x/sys v0.16.0
	gopkg.in/yaml.v2 v2.4.0
	gopkg.in/yaml.v3 v3.0.1
)

require (
	github.com/apache/thrift v0.16.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/coreos/go-semver v0.3.1 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/go-logr/logr v1.3.0 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.1 // indirect
	github.com/hashicorp/go-multierror v1.1.1 // indirect
	github.com/hashicorp/go-retryablehttp v0.5.4 // indirect
	github.com/hashicorp/go-rootcerts v1.0.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.2 // indirect
	github.com/hashicorp/go-version v1.6.0 // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/hashicorp/vault/sdk v0.1.13 // indirect
	github.com/jpillora/backoff v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/compress v1.17.4 // indirect
	github.com/knadh/koanf/v2 v2.0.1 // indirect
	github.com/matttproud/golang_protobuf_extensions/v2 v2.0.0 // indirect
	github.com/mitchellh/copystructure v1.2.0 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mitchellh/mapstructure v1.5.1-0.20220423185008-bf980b35cac4 // indirect
	github.com/mitchellh/reflectwalk v1.0.2 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/mostynb/go-grpc-compression v1.2.2 // indirect
	github.com/mwitkow/go-conntrack v0.0.0-20190716064945-2f068394615f // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/coreinternal v0.57.2 // indirect
	github.com/opentracing/opentracing-go v1.2.0 // indirect
	github.com/pierrec/lz4 v2.6.1+incompatible // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/prometheus/client_golang v1.17.0 // indirect
	github.com/prometheus/procfs v0.11.1 // indirect
	github.com/rs/cors v1.10.1 // indirect
	github.com/ryanuber/go-glob v1.0.0 // indirect
	github.com/stretchr/objx v0.5.0 // indirect
	github.com/uber/jaeger-client-go v2.30.0+incompatible // indirect
	github.com/uber/jaeger-lib v2.4.1+incompatible // indirect
	go.etcd.io/etcd/api/v3 v3.5.9 // indirect
	go.etcd.io/etcd/client/pkg/v3 v3.5.9 // indirect
	go.opentelemetry.io/collector v0.91.0 // indirect
	go.opentelemetry.io/collector/config/configauth v0.91.0 // indirect
	go.opentelemetry.io/collector/config/configcompression v0.91.0 // indirect
	go.opentelemetry.io/collector/config/configgrpc v0.91.0 // indirect
	go.opentelemetry.io/collector/config/confignet v0.91.0 // indirect
	go.opentelemetry.io/collector/config/configopaque v0.91.0 // indirect
	go.opentelemetry.io/collector/config/configtls v0.91.0 // indirect
	go.opentelemetry.io/collector/config/internal v0.91.0 // indirect
	go.opentelemetry.io/collector/extension/auth v0.91.0 // indirect
	go.opentelemetry.io/collector/featuregate v1.0.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.46.1 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.46.1 // indirect
	go.opentelemetry.io/otel v1.21.0 // indirect
	golang.org/x/crypto v0.14.0 // indirect
	golang.org/x/net v0.19.0 // indirect
	golang.org/x/oauth2 v0.12.0 // indirect
	golang.org/x/text v0.14.0 // indirect
	golang.org/x/time v0.3.0 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20231127180814-3a041ad873d4 // indirect
	google.golang.org/grpc v1.59.0 // indirect
	google.golang.org/protobuf v1.31.0 // indirect
	gopkg.in/square/go-jose.v2 v2.6.0 // indirect
)

// https://github.com/go-logr/logr/issues/51
replace k8s.io/klog/v2 => k8s.io/klog/v2 v2.80.1

// security updates
replace (
	github.com/containerd/containerd => github.com/containerd/containerd v1.6.18
	github.com/dgrijalva/jwt-go => github.com/form3tech-oss/jwt-go v3.2.5+incompatible
	github.com/form3tech-oss/jwt-go => github.com/golang-jwt/jwt/v4 v4.4.3
	github.com/hashicorp/consul/sdk => github.com/hashicorp/consul/sdk v0.13.1
	github.com/opencontainers/image-spec => github.com/opencontainers/image-spec v1.0.2
	golang.org/x/crypto => golang.org/x/crypto v0.5.0
	golang.org/x/net => golang.org/x/net v0.17.0
)

// required until all deps adopt something like https://github.com/open-telemetry/opentelemetry-collector/commit/6059751e64e0d7b857abff50f1d8ab90424d0306
// updating all cloud.google.com deps in this project doesn't resolve on its own.
replace cloud.google.com/go => cloud.google.com/go v0.110.2
