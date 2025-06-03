# Determinate Nix hash mismatch demo

First, try to build the package:

```shell
nix build
```

Uh-oh! There's a hash mismatch.

Let's fix that automatically:

```shell
determinate-nixd fix hashes --auto-apply --since "1 minute"
```

Now build again:

```shell
nix build
```

And you're done!
