# nperrin

Source code branch for adding content. After the build the generated `public` folder is served on the `master` branch.

## Dependencies

- [pandoc](https://pandoc.org/): for mapping markdown to html with the `nperrin.html5` template.
- [prettier](https://prettier.io/): to lint the generated html, so the source is served nice.

## Building

```
$ ./scripts/build.sh
```

## Linting

```
$ ./scripts/
```

## Deploy

A `master` folder should be created, that folder should contain a local repo fetching to this repo, and to the master branch. So when the `public` folder is generated, then it's copied to `mastr/public`, pushed and deployed.

```
$ ./scrips/deploy.sh
```

