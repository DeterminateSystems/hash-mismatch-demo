# Determinate Nix hash mismatch demo

First, try to build the package:

```shell
nix build
```

Uh-oh! There's a hash mismatch.

Now let's [install Determinate Nix][install].
Because with Determinate Nix, we can fix that automatically:

```shell
determinate-nixd fix hashes --auto-apply --since "1 minute"
```

This updates our [`flake.nix`](flake.nix) in place with the correct hash.

Now let's try building again:

```shell
nix build
```

And we're done!

Let's run our web server:

```shell
./result/bin/hash-mismatch-demo
```

In another terminal:

```shell
curl http://localhost:8080/ping
```

And we should see this as the output:

```json
{
  "message": "pong"
}
```

[install]: https://docs.determinate.systems
