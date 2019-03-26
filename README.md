# custom-node-local-dns

This project builds a custom image of the node-cache image available in
https://github.com/kubernetes/dns adding the Go files included in the `extra`
directory to the binary.

This is useful for extending the custom built coredns binary with extra
plugins.
