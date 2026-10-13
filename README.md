# Vertex

Vertex is a market-data platform in C++20. It is a learning project for low-latency systems.

Vertex reads raw exchange feeds in different formats. It converts them to one event stream and one order book for each symbol.

## Getting started

Install the tools on macOS:

```sh
brew install cmake ninja ccache llvm include-what-you-use pre-commit
```

The local stack also needs Docker, for example Colima.

```sh
pre-commit install   # format the code before each commit
make test            # build and test with ASan and UBSan
make up              # start Prometheus (:9090) and Grafana (:3000)
make down            # stop the stack
```

Run `make help` to see all targets. The [build ADR](docs/adr/0001-monorepo-and-build.md) explains the build design.

## License

See [LICENSE](LICENSE).
